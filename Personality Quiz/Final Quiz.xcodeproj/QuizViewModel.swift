import SwiftUI
import Observation

@Observable
class QuizViewModel {
    // MARK: - Quiz progress/state
    var results: [House] = []

    // MARK: - Derived results
    /// Returns the best-matching house name and description derived from `results`.
    var resolvedHouse: (name: String, description: String) {
        let pair = findHouse(from: results)
        return (pair[0], pair[1])
    }

    // MARK: - Mutations
    /// Append a result house. Prefer using this instead of mutating `results` directly.
    func addResult(_ house: House) {
        results.append(house)
    }

    /// Reset all collected results.
    func reset() {
        results.removeAll()
    }

    // MARK: - Logic migrated from free function
    /// Finds the most frequent house from the provided results and returns [name, description].
    func findHouse(from results: [House]) -> [String] {
        var allHouseCount: [House: Int] = [
            .Gryffindor: 0,
            .Slytherin: 0,
            .Hufflepuff: 0,
            .Ravenclaw: 0
        ]

        for house in results {
            allHouseCount[house, default: 0] += 1
        }

        let sorted = allHouseCount.sorted { $0.value > $1.value }
        let result = sorted.first?.key
        switch result {
        case .Gryffindor:
            return ["Gryffindor", "Brave, daring, and chivalrous. Known for courage and strong moral compass."]
        case .Slytherin:
            return ["Slytherin", "Ambitious, cunning, and resourceful. Values leadership and self-preservation."]
        case .Hufflepuff:
            return ["Hufflepuff", "Loyal, patient, and fair. Champions hard work and kindness."]
        case .Ravenclaw:
            return ["Ravenclaw", "Wise, witty, and curious. Celebrates intellect and creativity."]
        default:
            return ["Muggle", "Non-magical folk, living outside the wizarding world."]
        }
    }
}
