import SwiftUI

/// Displays assignment details and allows the user to mark it as complete.
struct AssignmentDetailView: View {
    @State var assignment: Assignment
    @State private var isUpdating = false
    @State private var isLoadingDetails = false // NEW: Tracks initial data load
    
    /// Helper to check if the assignment is currently marked as complete
    var isComplete: Bool {
        assignment.userProgress == "complete"
    }
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                // Header
                Text(assignment.name)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                HStack {
                    MetaPill(label: "Type", value: assignment.assignmentType.capitalized)
                    
                    if let due = assignment.dueOn {
                        MetaPill(label: "Due", value: due.utcFormatted())
                    }
                }
                
                Divider()
                
                // Content Body
                if isLoadingDetails {
                    ProgressView("Loading full details...")
                        .frame(maxWidth: .infinity, alignment: .center)
                        .padding()
                } else if let bodyText = assignment.body {
                    Text(bodyText)
                        .font(.body)
                        .foregroundColor(.primary)
                } else {
                    Text("No additional details provided.")
                        .italic()
                        .foregroundColor(.secondary)
                }
                
                Spacer(minLength: 40)
                
                // Action Button
                Button(action: toggleCompletion) {
                    HStack {
                        if isUpdating {
                            ProgressView()
                                .tint(.white)
                        } else {
                            Image(systemName: isComplete ? "xmark.circle.fill" : "checkmark.circle.fill")
                            Text(isComplete ? "Mark as Incomplete" : "Mark as Complete")
                        }
                    }
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(isComplete ? Color.danger : Color.success)
                    .cornerRadius(12)
                    .shadow(radius: 5)
                }
                .disabled(isUpdating || isLoadingDetails)
            }
            .padding()
        }
        .navigationTitle("Assignment")
        .navigationBarTitleDisplayMode(.inline)
        .background(Color.brandBackground)
        
        // NEW: Fetch full details when the view opens!
        .task {
            // Only fetch if we don't already have the body text
            if assignment.body == nil {
                isLoadingDetails = true
                do {
                    let fullAssignment = try await APIService.shared.fetchAssignmentDetails(id: assignment.id)
                    await MainActor.run {
                        self.assignment = fullAssignment
                        self.isLoadingDetails = false
                    }
                } catch {
                    print("⚠️ Failed to fetch full assignment: \(error)")
                    await MainActor.run {
                        self.isLoadingDetails = false
                    }
                }
            }
        }
    }
    
    /// Triggers the API call to toggle the user's progress
    private func toggleCompletion() {
        isUpdating = true
        let newProgress = isComplete ? "notStarted" : "complete"
        
        Task {
            do {
                let updatedAssignment = try await APIService.shared.updateAssignmentProgress(
                    assignmentID: assignment.id,
                    progress: newProgress
                )
                
                await MainActor.run {
                    self.assignment = updatedAssignment
                    self.isUpdating = false
                }
            } catch {
                print("⚠️ Failed to update progress: \(error)")
                await MainActor.run { self.isUpdating = false }
            }
        }
    }
}
