import SwiftUI

@Observable
class GameTrackorRouter {
    var navigationPath = NavigationPath()
    
    enum Route: Hashable {
        case GameTable
        case AddGame(game: Game)
    }
    
    @ViewBuilder
    func view(for route: Route) -> some View {
        switch route {
        case .GameTable:
            GameTableView()
        case let .AddGame(game):
            AddGameView(game: game)
        }
    }
    
    func navigateTo(route: Route) {
        navigationPath.append(route)
    }
}
