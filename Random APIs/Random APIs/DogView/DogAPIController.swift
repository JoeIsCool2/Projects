import SwiftUI

struct DogPicture: Codable {
    let message: String
}

protocol DogAPIControllerProtocol {
    func fetchPicture() async throws -> DogPicture
}

class DogAPIController: DogAPIControllerProtocol {
    func fetchPicture() async throws -> DogPicture {
        let url = URL(string: "https://dog.ceo/api/breeds/image/random")!
            
            let (data, response) = try await URLSession.shared.data(from: url)
            
            let decoded = try JSONDecoder().decode(DogPicture.self, from: data)
            print(decoded)
            return decoded
    }
}
