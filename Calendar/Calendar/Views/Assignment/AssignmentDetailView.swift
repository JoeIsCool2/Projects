//
//  AssignmentDetailView.swift
//  Calendar
//

import SwiftUI

// full assignment view with body and mark complete button
struct AssignmentDetailView: View {
    @State var assignment: Assignment
    @State private var isUpdating = false
    @State private var isLoadingDetails = false
    var onProgressUpdated: ((Assignment) -> Void)?
    
    var isComplete: Bool {
        assignment.userProgress == "complete"
    }
    
    var body: some View {
        List {
            Section {
                VStack(alignment: .leading, spacing: 12) {
                    HStack(spacing: 8) {
                        MetaPill(label: "Type", value: assignment.assignmentType)
                        if let due = assignment.dueOn {
                            MetaPill(label: "Due", value: due.utcFormatted())
                        }
                    }
                    
                    if isLoadingDetails {
                        ProgressView("Loading...")
                            .frame(maxWidth: .infinity)
                    } else if let bodyText = assignment.body {
                        Text(bodyText)
                            .font(.body)
                    } else {
                        Text("No details.")
                            .foregroundColor(.secondary)
                    }
                }
                .padding(.vertical, 8)
            } header: {
                Text(assignment.name)
                    .font(.headline)
            }
            
            Section {
                Button(action: toggleCompletion) {
                    HStack {
                        if isUpdating {
                            ProgressView()
                        } else {
                            Image(systemName: isComplete ? "xmark.circle" : "checkmark.circle")
                            Text(isComplete ? "Mark Incomplete" : "Mark Complete")
                        }
                    }
                    .frame(maxWidth: .infinity)
                    .foregroundColor(isComplete ? .red : .green)
                }
                .disabled(isUpdating || isLoadingDetails)
            }
        }
        .navigationTitle("Assignment")
        .navigationBarTitleDisplayMode(.inline)
        .task {
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
                    await MainActor.run { self.isLoadingDetails = false }
                }
            }
        }
    }
    
    func toggleCompletion() {
        isUpdating = true
        let newProgress = isComplete ? "notStarted" : "complete"
        
        Task {
            do {
                let response = try await APIService.shared.updateAssignmentProgress(
                    assignmentID: assignment.id,
                    progress: newProgress
                )
                await MainActor.run {
                    self.assignment = Assignment(
                        id: assignment.id,
                        name: assignment.name,
                        assignmentType: assignment.assignmentType,
                        assignedOn: assignment.assignedOn,
                        dueOn: assignment.dueOn,
                        userProgress: response.userProgress,
                        body: assignment.body
                    )
                    self.isUpdating = false
                    onProgressUpdated?(self.assignment)
                }
            } catch {
                print("Failed to update progress: \(error)")
                await MainActor.run { self.isUpdating = false }
            }
        }
    }
}
