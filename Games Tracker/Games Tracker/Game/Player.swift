import Foundation
import SwiftData

@Model
class Player: Comparable {
    @Attribute(.unique) var id: UUID
    var name: String
    var icon: GameIcon
    var score: Int
    var game: Game?
    
    init(id: UUID = UUID(),
         name: String,
         icon: GameIcon,
         score: Int,
         game: Game?) {
        self.id = id
        self.name = name
        self.icon = icon
        self.score = score
        self.game = game
    }
    static func < (lhs: Player, rhs: Player) -> Bool {
        // Example: sort primarily by score, then by name
        if lhs.score == rhs.score {
            return lhs.name < rhs.name
        }
        return lhs.score < rhs.score
    }
    
    static func == (lhs: Player, rhs: Player) -> Bool {
        lhs.id == rhs.id
    }
}
