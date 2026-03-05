//
//  AppState.swift
//  Calendar
//

import SwiftUI
import Observation

// holds login state and all the calendar/schedule data
@Observable
class AppState {
    var isAuthenticated = false
    var authError: String?
    var isLoggingIn = false
    var currentUser: UserProfile?
    
    var todayEntry: CalendarEntry?
    var groupedEntries: [String: [CalendarEntry]] = [:]
    var sortedMonthKeys: [String] = []
    var isLoading = false
    var scrollTargetID: String?
    
    init() {
        // try to restore last login
        if let data = UserDefaults.standard.data(forKey: "userProfile"),
           let user = try? JSONDecoder().decode(UserProfile.self, from: data),
           APIService.shared.isLoggedIn {
            self.currentUser = user
            self.isAuthenticated = true
            Task { await loadData() }
        }
    }
    
    func logout() {
        APIService.shared.logout()
        UserDefaults.standard.removeObject(forKey: "userProfile")
        isAuthenticated = false
        currentUser = nil
        todayEntry = nil
        groupedEntries = [:]
    }
    
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
    
    private func processFullSchedule(_ entries: [CalendarEntry]) {
        let sortedEntries = entries.sorted { $0.date < $1.date }
        let grouped = Dictionary(grouping: sortedEntries) { $0.monthSection }
        
        self.groupedEntries = grouped
        
        self.sortedMonthKeys = grouped.keys.sorted { key1, key2 in
            guard let date1 = grouped[key1]?.first?.date,
                  let date2 = grouped[key2]?.first?.date else { return false }
            return date1 < date2
        }
        
        // scroll to today or next day
        let now = Date()
        if let upcoming = sortedEntries.first(where: { $0.date >= now.addingTimeInterval(-86400) }) {
            self.scrollTargetID = upcoming.id
        }
    }
}
