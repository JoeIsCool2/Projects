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
    
    // what to show - full detail if we have it, else selected, else today
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
                VStack(spacing: 24) {
                    
                    if !isDetailMode {
                        // header with greeting and logout
                        HStack {
                            VStack(alignment: .leading) {
                                Text("\(greeting),")
                                    .font(.subheadline)
                                    .foregroundColor(.secondary)
                                Text(appState.currentUser?.firstName ?? "Student")
                                    .font(.largeTitle)
                                    .bold()
                            }
                            Spacer()
                            
                            Button(action: { appState.logout() }) {
                                Image(systemName: "person.circle.fill")
                                    .font(.system(size: 40))
                                    .foregroundColor(.brandPrimary)
                            }
                        }
                        .padding(.horizontal)
                        .padding(.top)
                    } else {
                        Spacer().frame(height: 10)
                    }
                    
                    if isLoadingDetails {
                        ProgressView("Fetching details...")
                            .padding(.top, 50)
                    }
                    else if let entry = displayEntry {
                        
                        // hero card with date and lesson name
                        VStack(alignment: .leading, spacing: 16) {
                            HStack {
                                Text(entry.date.utcFormatted().uppercased())
                                    .font(.caption).fontWeight(.bold).opacity(0.8)
                                Spacer()
                                if let id = entry.dayID {
                                    Text(id)
                                        .font(.caption).fontWeight(.black)
                                        .padding(6)
                                        .background(.white.opacity(0.2))
                                        .clipShape(Capsule())
                                }
                            }
                            
                            Text(entry.lessonName ?? "No Lesson")
                                .font(.system(size: 28, weight: .heavy))
                                .fixedSize(horizontal: false, vertical: true)
                            
                            HStack {
                                MetaPill(label: "Word", value: entry.wordOfTheDay ?? "N/A")
                                MetaPill(label: "ID", value: entry.lessonID?.uuidString.prefix(4).description ?? "N/A")
                            }
                        }
                        .foregroundColor(.white)
                        .padding(24)
                        .background(
                            LinearGradient(colors: [.brandPrimary, .brandSecondary], startPoint: .topLeading, endPoint: .bottomTrailing)
                        )
                        .cornerRadius(24)
                        .shadow(color: .brandPrimary.opacity(0.3), radius: 10, y: 5)
                        .padding(.horizontal)
                        
                        // objective, reading, challenge cards
                        VStack(spacing: 16) {
                            DetailCard(
                                title: "Main Objective",
                                icon: "target",
                                color: .brandPrimary,
                                content: entry.mainObjective,
                                emptyText: "No specific objective listed for today."
                            )
                            
                            LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 16) {
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
                                    color: .purple,
                                    content: entry.dailyCodeChallengeName,
                                    emptyText: "No challenge."
                                )
                            }
                        }
                        .padding(.horizontal)
                        
                        // assignments due today and assigned today
                        VStack(spacing: 20) {
                            AssignmentSection(
                                title: "Due Today",
                                assignments: entry.assignmentsDue,
                                color: .danger,
                                emptyMessage: "No assignments due today!"
                            )
                            
                            AssignmentSection(
                                title: "Assigned Today",
                                assignments: entry.newAssignments,
                                color: .success,
                                emptyMessage: "Nothing new assigned today."
                            )
                        }
                        
                    }
                    else {
                        ContentUnavailableView("No Data", systemImage: "calendar")
                    }
                }
                .padding(.bottom, 50)
            }
            .background(Color.brandBackground)
            .navigationTitle(isDetailMode ? "Details" : "")
            .navigationBarTitleDisplayMode(.inline)
            .task {
                // when we navigated from schedule we need to fetch full details
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
