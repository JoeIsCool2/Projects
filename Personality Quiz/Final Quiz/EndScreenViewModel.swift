import Foundation
import SwiftUI
import Observation

@Observable
final class EndScreenViewModel {
    var results: [House]
    var winningHouseName: String {
        switch winningHouse {
        case .Gryffindor: return "Gryffindor"
        case .Slytherin: return "Slytherin"
        case .Hufflepuff: return "Hufflepuff"
        case .Ravenclaw: return "Ravenclaw"
        default: return "Muggle"
        }
    }

    var descriptionText: String {
        switch winningHouse {
        case .Gryffindor:
            return "Brave, daring, and chivalrous. Known for courage and strong moral compass."
        case .Slytherin:
            return "Ambitious, cunning, and resourceful. Values leadership and self-preservation."
        case .Hufflepuff:
            return "Loyal, patient, and fair. Champions hard work and kindness."
        case .Ravenclaw:
            return "Wise, witty, and curious. Celebrates intellect and creativity."
        default:
            return "Non-magical folk, living outside the wizarding world."
        }
    }

    init(results: [House]) {
        self.results = results
    }
    
    private var winningHouse: House? {
        guard !results.isEmpty else { return nil }
        let counts = results.reduce(into: [House: Int]()) { $0[$1, default: 0] += 1 }
        return counts.max(by: { $0.value < $1.value })?.key
    }
}
