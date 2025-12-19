import Foundation
import Combine

@Observable
class GameSelection {
    var currentGame: Game?
    var findWinner = false
}
