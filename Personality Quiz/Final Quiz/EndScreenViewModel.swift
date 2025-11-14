import Foundation
import SwiftUI
import Combine

final class EndScreenViewModel: ObservableObject {
    @Published var results: [House]

    // Derived output
    @Published private(set) var winningHouseName: String = ""
    @Published private(set) var descriptionText: String = ""

    init(results: [House]) {
        self.results = results
        computeOutcome()
    }

    func computeOutcome() {
        var counts: [House: Int] = [
            .Gryffindor: 0,
            .Slytherin: 0,
            .Hufflepuff: 0,
            .Ravenclaw: 0
        ]
        for house in results { counts[house, default: 0] += 1 }
        let winner = counts.sorted { $0.value > $1.value }.first?.key
        switch winner {
        case .Gryffindor:
            winningHouseName = "Gryffindor"
            descriptionText = "Brave, daring, and chivalrous. Known for courage and strong moral compass."
        case .Slytherin:
            winningHouseName = "Slytherin"
            descriptionText = "Ambitious, cunning, and resourceful. Values leadership and self-preservation."
        case .Hufflepuff:
            winningHouseName = "Hufflepuff"
            descriptionText = "Loyal, patient, and fair. Champions hard work and kindness."
        case .Ravenclaw:
            winningHouseName = "Ravenclaw"
            descriptionText = "Wise, witty, and curious. Celebrates intellect and creativity."
        default:
            winningHouseName = "Muggle"
            descriptionText = "Non-magical folk, living outside the wizarding world."
        }
    }
}
