//
//  ScheduleView.swift
//  Calendar
//

import SwiftUI

// list of all days in the schedule by month
struct ScheduleView: View {
    @Environment(AppState.self) var appState
    @State private var hasScrolledInitial = false
    
    var body: some View {
        NavigationStack {
            ScrollViewReader { proxy in
                List {
                    if appState.isLoading && appState.groupedEntries.isEmpty {
                        ProgressView("Loading...")
                            .frame(maxWidth: .infinity)
                            .listRowBackground(Color.clear)
                    } else {
                        ForEach(appState.sortedMonthKeys, id: \.self) { month in
                            Section(header: Text(month)) {
                                ForEach(appState.groupedEntries[month] ?? []) { entry in
                                    ZStack {
                                        NavigationLink(destination: DashboardView(selectedEntry: entry)) {
                                            EmptyView()
                                        }
                                        .opacity(0)
                                        TimelineRow(entry: entry)
                                    }
                                    .listRowSeparator(.hidden)
                                    .listRowBackground(Color(.systemGroupedBackground))
                                    .id(entry.id)
                                }
                            }
                        }
                    }
                }
                .listStyle(.insetGrouped)
                .navigationTitle("Schedule")
                .refreshable {
                    await appState.loadData()
                }
                .onAppear {
                    if !hasScrolledInitial {
                        scrollToToday(proxy: proxy)
                    }
                }
            }
        }
    }
    
    func scrollToToday(proxy: ScrollViewProxy) {
        if let targetID = appState.scrollTargetID {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                withAnimation {
                    proxy.scrollTo(targetID, anchor: .top)
                    hasScrolledInitial = true
                }
            }
        }
    }
}
