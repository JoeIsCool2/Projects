//
//  AssignmentsView.swift
//  Calendar
//

import SwiftUI

// tab that shows all assignments, tap to see detail and mark complete
struct AssignmentsView: View {
    @Environment(AppState.self) var appState
    @State private var assignments: [Assignment] = []
    @State private var isLoading = false
    @State private var errorMessage: String?
    
    var body: some View {
        NavigationStack {
            Group {
                if isLoading && assignments.isEmpty {
                    ProgressView("Loading Assignments...")
                } else if let error = errorMessage {
                    ContentUnavailableView("Error", systemImage: "exclamationmark.triangle", description: Text(error))
                } else if assignments.isEmpty {
                    ContentUnavailableView("No Assignments", systemImage: "tray")
                } else {
                    List(assignments) { assignment in
                        NavigationLink(destination: AssignmentDetailView(assignment: assignment)) {
                            HStack(spacing: 16) {
                                if assignment.userProgress == "complete" {
                                    Image(systemName: "checkmark.circle.fill")
                                        .foregroundColor(Color.success)
                                        .font(.title2)
                                } else {
                                    Image(systemName: "circle")
                                        .foregroundColor(.gray.opacity(0.5))
                                        .font(.title2)
                                }
                                
                                VStack(alignment: .leading, spacing: 4) {
                                    Text(assignment.name)
                                        .font(.headline)
                                        .foregroundColor(.primary)
                                    
                                    Text(assignment.assignmentType.capitalized)
                                        .font(.caption)
                                        .padding(.horizontal, 8)
                                        .padding(.vertical, 2)
                                        .background(Color.gray.opacity(0.1))
                                        .cornerRadius(4)
                                }
                            }
                            .padding(.vertical, 4)
                        }
                    }
                    .listStyle(.plain)
                    .refreshable {
                        await loadAssignments()
                    }
                }
            }
            .navigationTitle("All Assignments")
            .background(Color.brandBackground)
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
                self.errorMessage = "Failed to load assignments. Please pull to refresh."
                self.isLoading = false
            }
        }
    }
}
