import SwiftUI

/// Displays the schedule grouped by month and navigates to day details.
struct ScheduleView: View {
    /// Shared app state providing schedule data and refresh.
    @Environment(AppState.self) var appState
    
    /// Tracks whether we've performed the initial auto-scroll.
    @State private var hasScrolledInitial = false
    
    var body: some View {
        NavigationStack {
            ScrollViewReader { proxy in
                List {
                    if appState.isLoading && appState.groupedEntries.isEmpty {
                        ProgressView("Loading Schedule...")
                            .frame(maxWidth: .infinity, alignment: .center)
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
                                    .listRowBackground(Color.clear)
                                    .id(entry.id)
                                }
                            }
                        }
                    }
                }
                .listStyle(.plain)
                .background(Color.brandBackground)
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
    
    /// Scrolls the list to the target entry (today/next).
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

