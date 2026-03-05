import SwiftUI
import Observation

/// Minimal user profile persisted locally for convenience.
struct UserProfile: Codable {
    /// Given name.
    let firstName: String
    /// Family name.
    let lastName: String
    /// Email address.
    let email: String
}

/// Central state container for authentication and calendar data.
/// Responsible for login/logout and fetching/organizing schedule entries.
@Observable
class AppState {
    /// Whether the user is currently authenticated.
    var isAuthenticated = false
    /// Error message to show on failed login.
    var authError: String?
    /// Indicates a login request is in flight.
    var isLoggingIn = false
    /// The currently signed-in user profile.
    var currentUser: UserProfile?
    
    /// The detailed entry for today (if available).
    var todayEntry: CalendarEntry?
    /// Schedule entries grouped by month section title.
    var groupedEntries: [String: [CalendarEntry]] = [:]
    /// Ordered list of month section titles for display.
    var sortedMonthKeys: [String] = []
    /// Indicates when schedule data is being fetched.
    var isLoading = false
    /// The entry ID to scroll to (today or next upcoming).
    var scrollTargetID: String? // Which day to scroll to
    
    /// Attempts to restore a previous session and pre-load data if possible.
    init() {
        if let data = UserDefaults.standard.data(forKey: "userProfile"),
           let user = try? JSONDecoder().decode(UserProfile.self, from: data),
           APIService.shared.isLoggedIn {
            self.currentUser = user
            self.isAuthenticated = true
            Task { await loadData() }
        }
    }
    
    /// Clears local session state and tokens.
    func logout() {
        APIService.shared.logout()
        UserDefaults.standard.removeObject(forKey: "userProfile")
        isAuthenticated = false
        currentUser = nil
        todayEntry = nil
        groupedEntries = [:]
    }
    
    /// Starts an async login flow and persists the user profile on success.
    func login(email: String, pass: String) {
        isLoggingIn = true
        authError = nil
        
        Task {
            do {
                let response = try await APIService.shared.login(email: email, pass: pass)
                
                let user = UserProfile(firstName: response.firstName, lastName: response.lastName, email: response.email)
                if let encoded = try? JSONEncoder().encode(user) {
                    UserDefaults.standard.set(encoded, forKey: "userProfile")
                }
                
                await MainActor.run {
                    self.currentUser = user
                    self.isAuthenticated = true
                    self.isLoggingIn = false
                }
                await loadData()
            } catch {
                await MainActor.run {
                    self.authError = "Incorrect email or password."
                    self.isLoggingIn = false
                }
            }
        }
    }
    
    /// Loads today's entry and the safe schedule concurrently.
    func loadData() async {
        await MainActor.run { self.isLoading = true }
        
        async let todayTask = APIService.shared.fetchToday()
        async let scheduleTask = APIService.shared.fetchSafeSchedule()
        
        let todayResult = try? await todayTask
        let scheduleResult = try? await scheduleTask
        
        await MainActor.run {
            self.todayEntry = todayResult
            if let schedule = scheduleResult {
                self.processFullSchedule(schedule)
            }
            self.isLoading = false
        }
    }
    
    /// Groups, sorts, and prepares schedule entries for display and scrolling.
    private func processFullSchedule(_ entries: [CalendarEntry]) {
        let sortedEntries = entries.sorted { $0.date < $1.date }
        let grouped = Dictionary(grouping: sortedEntries) { $0.monthSection }
        
        self.groupedEntries = grouped
        
        self.sortedMonthKeys = grouped.keys.sorted { key1, key2 in
            guard let date1 = grouped[key1]?.first?.date,
                  let date2 = grouped[key2]?.first?.date else { return false }
            return date1 < date2
        }
        
        let now = Date()
        if let upcoming = sortedEntries.first(where: { $0.date >= now.addingTimeInterval(-86400) }) {
            self.scrollTargetID = upcoming.id
        }
    }
}

