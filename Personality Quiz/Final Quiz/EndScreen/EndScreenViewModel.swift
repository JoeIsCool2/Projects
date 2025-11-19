import SwiftUI
import Observation

@Observable
class EndScreenViewModel {
    var results: [House]
    var allHouseCount: [House: Int] = [
        .Gryffindor: 0,
        .Slytherin: 0,
        .Hufflepuff: 0,
        .Ravenclaw: 0
    ]
    
    init(results: [House]) {
        self.results = results
        calculateHouseCounts()
    }
    
    private func calculateHouseCounts() {
        for house in results {
            allHouseCount[house, default: 0] += 1
        }
    }
    
    func finalResult() -> (house: String, description: String) {
        let sorted = allHouseCount.sorted { $0.value > $1.value }
        let result = sorted.first?.key
        switch result {
        case .Gryffindor:
            return ("Gryffindor", "Brave, daring, and chivalrous. Known for courage and strong moral compass.")
        case .Slytherin:
            return ("Slytherin", "Ambitious, cunning, and resourceful. Values leadership and self-preservation.")
        case .Hufflepuff:
            return ("Hufflepuff", "Loyal, patient, and fair. Champions hard work and kindness.")
        case .Ravenclaw:
            return ("Ravenclaw", "Wise, witty, and curious. Celebrates intellect and creativity.")
        default:
            return ("Muggle", "Non-magical folk, living outside the wizarding world.")
        }
    }
}
