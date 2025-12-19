import Foundation
import SwiftData

@Model
class Game: Identifiable {
    // If you want a custom UUID, mark it .unique
    @Attribute(.unique) var id: UUID
    var name: String
    var icon: GameIcon
    var createdAt: Date
    var winner: Player?
    var sortBy: SortTypes? = SortTypes.HighestScore
    var selectWinnerBy: SortTypes? = SortTypes.HighestScore
    
    @Relationship(deleteRule: .cascade, inverse: \Player.game)
    var players: [Player]

    init(id: UUID = UUID(),
         name: String,
         icon: GameIcon,
         createdAt: Date,
         players: [Player],
         winner: Player?,
         sortBy: SortTypes = .HighestScore,
         selectWinnerBy: SortTypes = .HighestScore) {
        self.id = id
        self.name = name
        self.icon = icon
        self.createdAt = createdAt
        self.players = players
        self.winner = winner
        self.sortBy = sortBy
        self.selectWinnerBy = selectWinnerBy
    }
}
