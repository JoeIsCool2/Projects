import SwiftUI
import SwiftData

struct GameTableView: View {
    @State private var viewModel = GameTableViewModel()
    @Query(sort: \Game.createdAt, order: .reverse) var games: [Game]
    @Query(sort: \Player.score, order: .forward) private var players: [Player]
    @Environment(\.modelContext) var context
    @Environment(GameTrackorRouter.self) var router
    @Environment(GameSelection.self) var gameSelection
    @Namespace private var animate

    var body: some View {
            ZStack {
                Color.midnightViolet.ignoresSafeArea()
                VStack {
                    Rectangle()
                        .frame(height: 100)
                        .foregroundStyle(.clear)
                    ZStack {
                        List {
                            // Top spacer
                            Section {
                                Color.clear
                                    .frame(height: 200) // acts like top padding
                                    .listRowInsets(EdgeInsets()) // no default padding
                                    .listRowBackground(Color.clear)
                            }
                            ForEach(games) { game in
                                Button {
                                    gameSelection.currentGame = game
                                    router.navigateTo(route: .AddGame(game: game))
                                } label: {
                                    GameTableCapsule(game: game)
                                }
                                // 2. This prevents the standard "Blue Text" button look
                                .buttonStyle(.plain)
                                .listRowInsets(EdgeInsets())
                                .listRowBackground(Color.clear)
                                .padding(5)
                            }
                            .onDelete(perform: deleteGames)
                            
                            // Bottom spacer
                            Section {
                                Color.clear
                                    .frame(height: 200) // acts like bottom padding
                                    .listRowInsets(EdgeInsets())
                                    .listRowBackground(Color.clear)
                            }
                        }
                        .listStyle(.plain)
                        .scrollContentBackground(.hidden)
                        
                        .onScrollGeometryChange(for: Double.self) { geo in
                            // THIS is the real scroll offset
                            let offset = geo.contentOffset.y
                            return offset
                        } action: { _, offset in
                            withAnimation(.easeOut(duration: 0.2)) {
                                viewModel.heightOfGames = offset
                            }
                        }
                        
                        LinearGradient(colors: [.midnightViolet, .clear, .clear, .midnightViolet],
                                       startPoint: .bottom, endPoint: .top)
                        .allowsHitTesting(false)

                        ZStack {
                            let normalized = max(min(viewModel.heightOfGames / 300, 1), 0)
                            let stretch = 5.0 - (normalized * 4.0)
                            VStack {
                                Image(.gameTable10) // Your header image
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(height: 100)
                                    .scaleEffect(x: 1.0, y: stretch > 2.7 ? stretch : 2.7, anchor: .top)
                                    .offset(x: 0, y: -200)
                                Spacer()
                            }
                        }
                        .allowsHitTesting(false)
                    }
                    Spacer()
                    ZStack {
                        HStack {
                            Spacer()
                            Image(systemName: "plus")
                                .foregroundStyle(.midnightBlue)
                                .frame(width: 40, height: 40)
                                .scaleEffect(1.8)
                            Spacer()
                        }
                        .background(
                            RoundedRectangle(cornerRadius: 20)
                                .fill(.celadon)
                                .matchedGeometryEffect(id: "add-card", in: animate)
                        )
                    }
                    .scaleEffect(viewModel.isAddPressed ? 0.9 : 1.0)
                    .onTapGesture {
                        withAnimation(.easeInOut(duration: 0.1)) {
                            viewModel.isAddPressed.toggle()
                        } completion: {
                            withAnimation(.easeInOut(duration: 0.1)) {
                                viewModel.isAddPressed.toggle()
                            } completion: {
                                viewModel.isAddingGame = true
                            }
                        }
                    }
                    .sheet(isPresented: $viewModel.isAddingGame) {
                        NavigationStack {
                            AddGameView(game: nil)
                        }
                    }
                }
                .padding()
            }
        .environment(router)
        .onAppear() {
            gameSelection.findWinner = true
        }
    }
}

extension GameTableView {
    func deleteGames(at offsets: IndexSet) {
           for index in offsets {
               let game = games[index]
               context.delete(game)
           }
       }
}

#Preview {
    GameTableView()
        .modelContainer(for: [Game.self, Player.self])
        .environment(GameTrackorRouter())
        .environment(GameSelection())
}

