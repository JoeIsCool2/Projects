//
//  AssignmentDetailView.swift
//  Calendar
//

import SwiftUI

// full assignment view with body text and mark complete button
struct AssignmentDetailView: View {
    @State var assignment: Assignment
    @State private var isUpdating = false
    @State private var isLoadingDetails = false
    
    var isComplete: Bool {
        assignment.userProgress == "complete"
    }
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
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
        .task {
            // fetch full details if we dont have body yet
            if assignment.body == nil {
                isLoadingDetails = true
                do {
                    let fullAssignment = try await APIService.shared.fetchAssignmentDetails(id: assignment.id)
                    await MainActor.run {
                        self.assignment = fullAssignment
                        self.isLoadingDetails = false
                    }
                } catch {
                    print("Failed to fetch assignment: \(error)")
                    await MainActor.run {
                        self.isLoadingDetails = false
                    }
                }
            }
        }
    }
    
    func toggleCompletion() {
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
                print("Failed to update progress: \(error)")
                await MainActor.run { self.isUpdating = false }
            }
        }
    }
}
