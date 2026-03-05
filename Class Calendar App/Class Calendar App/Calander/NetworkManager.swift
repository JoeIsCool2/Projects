import Foundation

class NetworkManager {
    static let shared = NetworkManager()
    
    private let baseURL = "https://social-media-app.ryanplitt.com"
    
    var userSecret: String? {
        get { UserDefaults.standard.string(forKey: "userSecret") }
        set { UserDefaults.standard.set(newValue, forKey: "userSecret") }
    }
    
    func login(email: String, password: String) async -> Bool {
        guard let url = URL(string: "\(baseURL)/auth/login") else { return false }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let body = ["email": email, "password": password]
        request.httpBody = try? JSONSerialization.data(withJSONObject: body)
        
        do {
            let (data, response) = try await URLSession.shared.data(for: request)
            
            // Debugging: Print server response if it fails
            if (response as? HTTPURLResponse)?.statusCode != 200 {
                print("Login Error: \(String(data: data, encoding: .utf8) ?? "Unknown")")
                return false
            }
            
            let decoded = try JSONDecoder().decode(SignInResponseDTO.self, from: data)
            self.userSecret = decoded.secret
            return true
        } catch {
            print("Network Error: \(error.localizedDescription)")
            return false
        }
    }
    
    func fetchCalendar() async -> [CalendarEntryResponseDTO] {
        guard let url = URL(string: "\(baseURL)/calendar/all"), let secret = userSecret else { return [] }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        // Ensure this matches your cohort
        let body = ["userSecret": secret, "cohort": "fall2025"]
        request.httpBody = try? JSONSerialization.data(withJSONObject: body)
        
        do {
            let (data, response) = try await URLSession.shared.data(for: request)
             
            if (response as? HTTPURLResponse)?.statusCode != 200 {
                 print("Calendar Error: \(String(data: data, encoding: .utf8) ?? "Unknown")")
                 return []
            }
            
            return try JSONDecoder().decode([CalendarEntryResponseDTO].self, from: data)
        } catch {
            print("Fetch Error: \(error.localizedDescription)")
            return []
        }
    }
}
