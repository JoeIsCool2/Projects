import SwiftUI

struct Representative: Codable, Identifiable {
    let name: String
    let party: String
    let state: String
    let district: String
    let phone: String
    let office: String
    let link: String
    
    var id: String {
            "\(name)-\(party)"
        }
}

struct RepresentativesResponse: Codable {
    let results: [Representative]
}

protocol RepresentativeAPIControllerProtocol {
    func fetchRep(zipCode: String) async throws -> RepresentativesResponse
}

class RepresentativeAPIController: RepresentativeAPIControllerProtocol {
    
    func fetchRep(zipCode: String) async throws -> RepresentativesResponse {
        let url = URL(string: "https://whoismyrepresentative.com/getall_mems.php?zip=\(zipCode)&output=json")!
        let (data, _) = try await URLSession.shared.data(from: url)
        let decoded = try JSONDecoder().decode(RepresentativesResponse.self, from: data)
        return decoded
    }
}
