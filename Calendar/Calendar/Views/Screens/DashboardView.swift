//
//  DashboardView.swift
//  Calendar
//

import SwiftUI

// home screen - shows today (or selected day) with lesson info and assignments
struct DashboardView: View {
    @Environment(AppState.self) var appState
    
    var selectedEntry: CalendarEntry? = nil
    @State private var fullEntry: CalendarEntry?
    @State private var isLoadingDetails = false
    
    var isDetailMode: Bool {
        return selectedEntry != nil
    }
    
    var displayEntry: CalendarEntry? {
        return fullEntry ?? selectedEntry ?? appState.todayEntry
    }
    
    var greeting: String {
        let hour = Calendar.current.component(.hour, from: Date())
        if hour < 12 { return "Good Morning" }
        if hour < 17 { return "Good Afternoon" }
        return "Good Evening"
    }

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 16) {
                    
                    if !isDetailMode {
                        HStack {
                            VStack(alignment: .leading, spacing: 2) {
                                Text("\(greeting),")
                                    .font(.subheadline)
                                    .foregroundColor(.secondary)
                                Text(appState.currentUser?.firstName ?? "Student")
                                    .font(.title2)
                                    .fontWeight(.semibold)
                            }
                            Spacer()
                            Button(action: { appState.logout() }) {
                                Image(systemName: "person.circle.fill")
                                    .font(.title2)
                                    .foregroundColor(.blue)
                            }
                        }
                        .padding(.horizontal)
                        .padding(.top, 8)
                    } else {
                        Spacer().frame(height: 8)
                    }
                    
                    if isLoadingDetails {
                        ProgressView("Loading...")
                            .padding(.top, 40)
                    }
                    else if let entry = displayEntry {
                        
                        // today/selected day card - simple white with blue bar
                        VStack(alignment: .leading, spacing: 12) {
                            HStack {
                                Text(entry.date.utcFormatted())
                                    .font(.caption)
                                    .foregroundColor(.secondary)
                                Spacer()
                                if let id = entry.dayID {
                                    Text("Day \(id)")
                                        .font(.caption)
                                        .padding(4)
                                        .background(Color.blue.opacity(0.15))
                                        .cornerRadius(4)
                                }
                            }
                            
                            Text(entry.lessonName ?? "No Lesson")
                                .font(.title2)
                                .fontWeight(.bold)
                            
                            HStack(spacing: 8) {
                                MetaPill(label: "Word", value: entry.wordOfTheDay ?? "N/A")
                                MetaPill(label: "ID", value: entry.lessonID?.uuidString.prefix(4).description ?? "N/A")
                            }
                        }
                        .padding(16)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(Color.white)
                        .overlay(
                            Rectangle()
                                .fill(Color.blue)
                                .frame(width: 4),
                            alignment: .leading
                        )
                        .cornerRadius(8)
                        .padding(.horizontal)
                        
                        VStack(spacing: 12) {
                            DetailCard(
                                title: "Main Objective",
                                icon: "target",
                                color: .blue,
                                content: entry.mainObjective,
                                emptyText: "No objective listed."
                            )
                            
                            LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 12) {
                                DetailCard(
                                    title: "Reading",
                                    icon: "book.fill",
                                    color: .blue,
                                    content: entry.readingDue,
                                    emptyText: "No reading."
                                )
                                DetailCard(
                                    title: "Challenge",
                                    icon: "laptopcomputer",
                                    color: .blue,
                                    content: entry.dailyCodeChallengeName,
                                    emptyText: "No challenge."
                                )
                            }
                        }
                        .padding(.horizontal)
                        
                        VStack(alignment: .leading, spacing: 12) {
                            AssignmentSection(
                                title: "Due Today",
                                assignments: entry.assignmentsDue,
                                color: .red,
                                emptyMessage: "No assignments due today"
                            )
                            AssignmentSection(
                                title: "Assigned Today",
                                assignments: entry.newAssignments,
                                color: .green,
                                emptyMessage: "Nothing new today"
                            )
                        }
                        
                    }
                    else {
                        ContentUnavailableView("No Data", systemImage: "calendar")
                    }
                }
                .padding(.bottom, 24)
            }
            .background(Color(.systemGroupedBackground))
            .navigationTitle(isDetailMode ? "Details" : "")
            .navigationBarTitleDisplayMode(.inline)
            .task {
                if let liteEntry = selectedEntry {
                    isLoadingDetails = true
                    do {
                        let fetchedDetails = try await APIService.shared.fetchDate(liteEntry.date)
                        self.fullEntry = fetchedDetails
                    } catch {
                        print("Error fetching details: \(error)")
                    }
                    isLoadingDetails = false
                }
            }
        }
    }
}
