import SwiftUI
import SwiftData

struct RootView: View {
    @State private var router = GameTrackorRouter()
    @State var gameSelection = GameSelection()
    
    var body: some View {
        NavigationStack(path: $router.navigationPath) {
            GameTableView()
                // This is the correct place for it
                .navigationDestination(for: GameTrackorRouter.Route.self) { route in
                    router.view(for: route)
                }
        }
        .modelContainer(for: [Game.self, Player.self])
        .environment(router)
        .environment(gameSelection)
    }
}
