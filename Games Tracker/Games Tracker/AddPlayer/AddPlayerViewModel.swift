import SwiftData
import SwiftUI

@Observable
class AddPlayerViewModel {
    var player: Player = Player(name: "", icon: .person, score: 0, game: nil)
    var isChanging = false
    var selectedIcon: GameIcon = .person
    var playerScore = 0
    
    func add() {
        playerScore += 1
    }
    func minus() {
        playerScore -= 1
    }
}
