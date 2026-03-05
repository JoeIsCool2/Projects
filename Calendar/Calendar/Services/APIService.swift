//
//  APIService.swift
//  Calendar
//

import Foundation

// handles all the API calls - login, calendar, assignments
class APIService {
    static let shared = APIService()
    
    private let baseURL = "https://social-media-app.ryanplitt.com"
    private let cohort = "fall2025"
    private let tokenKey = "authToken"
    
    private var authToken: String? {
        get { UserDefaults.standard.string(forKey: tokenKey) }
        set { UserDefaults.standard.set(newValue, forKey: tokenKey) }
    }
    
    var isLoggedIn: Bool {
        return authToken != nil
    }
    
    // API returns dates in this format
    private let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        formatter.calendar = Calendar(identifier: .iso8601)
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        return formatter
    }()
    
    private init() {}
    
    // MARK: - Login / Logout
    
    func logout() {
        UserDefaults.standard.removeObject(forKey: tokenKey)
        print("Logged out")
    }
    
    func login(email: String, pass: String) async throws -> SignInResponseDTO {
        guard let url = URL(string: "\(baseURL)/auth/login") else { throw APIError.invalidURL }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let body = SignInRequest(email: email, password: pass)
        request.httpBody = try JSONEncoder().encode(body)
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw APIError.serverError("Login failed")
        }
        
        let decoded = try JSONDecoder().decode(SignInResponseDTO.self, from: data)
        self.authToken = decoded.secret
        return decoded
    }
    
    // MARK: - Calendar
    
    func fetchToday() async throws -> CalendarEntry {
        return try await performRequest(endpoint: "/calendar/today?cohort=\(cohort)")
    }
    
    func fetchDate(_ date: Date) async throws -> CalendarEntry {
        let dateString = date.yyyyMMdd()
        let endpoint = "/calendar/date/\(dateString)?cohort=\(cohort)"
        return try await performRequest(endpoint: endpoint)
    }
    
    func fetchSafeSchedule() async throws -> [CalendarEntry] {
        guard let token = authToken else { throw APIError.serverError("Not Logged In") }
        guard let url = URL(string: baseURL + "/calendar/all?cohort=\(cohort)") else { throw APIError.invalidURL }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        
        let (data, _) = try await URLSession.shared.data(for: request)
        
        guard let jsonArray = try JSONSerialization.jsonObject(with: data) as? [[String: Any]] else {
            return []
        }
        
        var validEntries: [CalendarEntry] = []
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .formatted(dateFormatter)
        
        for item in jsonArray {
            do {
                let itemData = try JSONSerialization.data(withJSONObject: item)
                let entry = try decoder.decode(CalendarEntry.self, from: itemData)
                validEntries.append(entry)
            } catch {
                print("Skipping bad schedule entry")
            }
        }
        return validEntries
    }
    
    // generic GET with auth and decode
    private func performRequest<T: Decodable>(endpoint: String) async throws -> T {
        guard let token = authToken else { throw APIError.serverError("Not Logged In") }
        guard let url = URL(string: baseURL + endpoint) else { throw APIError.invalidURL }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        
        let (data, _) = try await URLSession.shared.data(for: request)
        
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .formatted(dateFormatter)
        return try decoder.decode(T.self, from: data)
    }
    
    // MARK: - Assignments
    
    func updateAssignmentProgress(assignmentID: UUID, progress: String) async throws -> Assignment {
        guard let token = authToken else { throw APIError.serverError("Not Logged In") }
        guard let url = URL(string: baseURL + "/assignment/progress") else { throw APIError.invalidURL }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let body = ProgressUpdateRequest(assignmentID: assignmentID, progress: progress)
        request.httpBody = try JSONEncoder().encode(body)
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
            throw APIError.invalidResponse
        }
        
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .formatted(dateFormatter)
        return try decoder.decode(Assignment.self, from: data)
    }
    
    func fetchAllAssignments() async throws -> [Assignment] {
        let endpoint = "/assignment/all?includeProgress=true&includeFAQs=true&cohort=\(cohort)"
        return try await performRequest(endpoint: endpoint)
    }
    
    func fetchAssignmentDetails(id: UUID) async throws -> Assignment {
        let endpoint = "/assignment/\(id.uuidString)?includeProgress=true&includeFAQs=true"
        return try await performRequest(endpoint: endpoint)
    }
}
