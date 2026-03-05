import Foundation

/// Errors that can occur during API requests.
enum APIError: Error {
    case invalidURL
    case invalidResponse
    case serverError(String)
    case decodingError(Error)
}

/// Simple networking service handling auth and calendar endpoints.
/// Uses a shared singleton for convenience in a small app.
class APIService {
    /// Shared singleton instance.
    static let shared = APIService()
    
    /// Base URL for backend.
    private let baseURL = "https://social-media-app.ryanplitt.com"
    /// Current cohort identifier sent to the API.
    private let cohort = "fall2025"
    /// UserDefaults key for persisted auth token.
    private let tokenKey = "authToken"
    
    /// Persisted bearer token used for authenticated requests.
    private var authToken: String? {
        get { UserDefaults.standard.string(forKey: tokenKey) }
        set { UserDefaults.standard.set(newValue, forKey: tokenKey) }
    }
    
    /// Indicates whether a valid token exists.
    var isLoggedIn: Bool {
        return authToken != nil
    }
    
    /// Date formatter matching the API's ISO-8601-like format.
    private let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        formatter.calendar = Calendar(identifier: .iso8601)
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        return formatter
    }()
    
    /// Private to enforce singleton usage.
    private init() {}
    
    // MARK: - Auth Functions
    /// Clears the saved token without contacting the server.
    func logout() {
        UserDefaults.standard.removeObject(forKey: tokenKey)
        print("🔒 Logged out locally.")
    }
    
    /// Attempts to authenticate and persist the returned token.
    /// - Parameters:
    ///   - email: User email.
    ///   - pass: Plaintext password.
    /// - Returns: The decoded sign-in response.
    /// - Throws: APIError on invalid URL/response or decoding errors.
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
    
    /// Fetches the detailed calendar entry for today.
    func fetchToday() async throws -> CalendarEntry {
        return try await performRequest(endpoint: "/calendar/today?cohort=\(cohort)")
    }
    
    /// Fetches the detailed calendar entry for a specific date.
    func fetchDate(_ date: Date) async throws -> CalendarEntry {
        let dateString = date.yyyyMMdd() // Uses helper extension
        let endpoint = "/calendar/date/\(dateString)?cohort=\(cohort)"
        return try await performRequest(endpoint: endpoint)
    }
    
    /// Fetches the full schedule (lite entries)
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
                print("⚠️ Skipping invalid schedule entry")
            }
        }
        return validEntries
    }
    
    /// Performs an authenticated GET request and decodes the response.
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
}

extension Date {
    /// Formats a date as yyyy-MM-dd in UTC for API paths.
    func yyyyMMdd() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        return formatter.string(from: self)
    }
}

// Add this request struct anywhere in APIService.swift or Models.swift
struct ProgressUpdateRequest: Encodable {
    let assignmentID: UUID
    let progress: String
}

extension APIService {
    /// Updates the completion status of a specific assignment
    func updateAssignmentProgress(assignmentID: UUID, progress: String) async throws -> Assignment {
        guard let token = authToken else { throw APIError.serverError("Not Logged In") }
        guard let url = URL(string: baseURL + "/assignment/progress") else { throw APIError.invalidURL }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type") // Required for POST bodies
        
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
}

extension APIService {
    /// Fetches all assignments for the current cohort, including user progress.
    func fetchAllAssignments() async throws -> [Assignment] {
        // Appending the required query parameters based on the API spec
        let endpoint = "/assignment/all?includeProgress=true&includeFAQs=true&cohort=\(cohort)"
        return try await performRequest(endpoint: endpoint)
    }
}

extension APIService {
    /// Fetches the full detailed version of a single assignment
    func fetchAssignmentDetails(id: UUID) async throws -> Assignment {
        let endpoint = "/assignment/\(id.uuidString)?includeProgress=true&includeFAQs=true"
        return try await performRequest(endpoint: endpoint)
    }
}
