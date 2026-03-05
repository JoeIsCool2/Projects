//
//  AssignmentsView.swift
//  Calendar
//

import SwiftUI

// tab that shows all assignments
struct AssignmentsView: View {
    @Environment(AppState.self) var appState
    @State private var assignments: [Assignment] = []
    @State private var isLoading = false
    @State private var errorMessage: String?
    
    var body: some View {
        NavigationStack {
            Group {
                if isLoading && assignments.isEmpty {
                    ProgressView("Loading...")
                } else if let error = errorMessage {
                    ContentUnavailableView("Error", systemImage: "exclamationmark.triangle", description: Text(error))
                } else if assignments.isEmpty {
                    ContentUnavailableView("No Assignments", systemImage: "tray")
                } else {
                    List(assignments) { assignment in
                        NavigationLink(destination: AssignmentDetailView(
                            assignment: assignment,
                            onProgressUpdated: { updated in
                                assignments = assignments.map { $0.id == updated.id ? updated : $0 }
                            }
                        )) {
                            HStack(spacing: 12) {
                                if assignment.userProgress == "complete" {
                                    Image(systemName: "checkmark.circle.fill")
                                        .foregroundColor(.green)
                                } else {
                                    Image(systemName: "circle")
                                        .foregroundColor(.gray)
                                }
                                VStack(alignment: .leading, spacing: 2) {
                                    Text(assignment.name)
                                        .font(.headline)
                                    Text(assignment.assignmentType)
                                        .font(.caption)
                                        .foregroundColor(.secondary)
                                }
                            }
                        }
                    }
                    .listStyle(.insetGrouped)
                    .refreshable {
                        await loadAssignments()
                    }
                }
            }
            .navigationTitle("Assignments")
            .task {
                if assignments.isEmpty {
                    await loadAssignments()
                }
            }
        }
    }
    
    func loadAssignments() async {
        isLoading = true
        errorMessage = nil
        do {
            let fetched = try await APIService.shared.fetchAllAssignments()
            await MainActor.run {
                self.assignments = fetched
                self.isLoading = false
            }
        } catch {
            print("Failed to load assignments: \(error)")
            await MainActor.run {
                self.errorMessage = "Failed to load. Pull to refresh."
                self.isLoading = false
            }
        }
    }
}
