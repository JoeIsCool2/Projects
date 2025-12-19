import SwiftData
import SwiftUI

@Observable
class AddGameViewModel {
    var game: Game = Game(name: "", icon: .gamecontroller, createdAt: Date.now, players: [], winner: nil)
    var isChanging = false
    var selectedIcon: GameIcon = .gamecontroller
    var sortBy: SortTypes = .HighestScore
    var selectWinnerBy: SortTypes = .HighestScore
    var isAddPressed = false
    var isAdding = false
    var isNewGame = false
    var playerDeleting: Player? = nil
    
    var sortOrder: SortOrder {
        switch sortBy {
        case .HighestScore: .reverse
        case .LowestScore: .forward
        }
    }
    
    func findWinner(game: Game, players: [Player]) -> Player? {
        let filteredPlayers = players.filter { $0.game == game  }
        let sortedPlayers =  filteredPlayers.sorted()
        switch selectWinnerBy {
        case .LowestScore:
            if let firstPlayer = sortedPlayers.first {
                return firstPlayer
            }
        case .HighestScore:
            if let lastPlayer = sortedPlayers.last {
                return lastPlayer
            }
        }
        return nil
    }
}
