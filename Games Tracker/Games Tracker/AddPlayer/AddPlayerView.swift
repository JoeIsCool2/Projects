import SwiftUI
import SwiftData
import Combine

struct AddPlayerView: View {
    @Query(sort: \Game.createdAt, order: .reverse) var games: [Game]
    @Environment(\.modelContext) var context
    
    @State var viewModel = AddPlayerViewModel()
    @Environment(GameSelection.self) var gameSelection
    @Environment(\.dismiss) var dismiss
    
    private let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.midnightViolet.ignoresSafeArea()
                VStack {
                    Spacer()
                    TextField("Name Of Player", text: $viewModel.player.name)
                        .foregroundStyle(.midnightBlue)
                        .font(.custom("scrible", size: 40))
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 20)
                                .fill(.celadon)
                        )
                        .padding()
                        .tint(.midnightBlue)
                    ScrollView {
                        HStack {
                            Text("Game Symbole:")
                                .foregroundStyle(.slateGrey)
                            Image(systemName: viewModel.player.icon.rawValue)
                                .foregroundStyle(.celadonDark)
                            Spacer()
                        }
                        .font(.custom("scrible", size: 20))
                        .padding()
                        .padding(.bottom, -30)
                        LazyVGrid(columns: columns, spacing: 20) {
                            ForEach(GameIcon.allCases) { icon in
                                Button {
                                    withAnimation(.smooth) {
                                        viewModel.selectedIcon = icon
                                        viewModel.player.icon = icon
                                    }
                                } label: {
                                    Image(systemName: icon.rawValue)
                                        .font(.system(size: 30))
                                        .frame(width: 50, height: 50)
                                        .background(
                                            RoundedRectangle(cornerRadius: 12)
                                                .fill(viewModel.selectedIcon == icon ? Color.celadon : Color.clear)
                                        )
                                        .foregroundStyle(viewModel.selectedIcon == icon ? .midnightBlue : .slateGrey)
                                }
                            }
                        }
                        .padding()
                        
                        Stepper("Score: \(viewModel.playerScore)", onIncrement: viewModel.add, onDecrement: viewModel.minus)
                            .font(.custom("scrible", size: 40))
                            .foregroundStyle(.celadon)
                            .padding()
                        if let gameName = viewModel.player.game?.name {
                            Text("Game: \(gameName)")
                        }
//                        Text("Game: \(String(describing: viewModel.player.game?.name))")
                    }
                    .toolbar {
                        ToolbarItem(placement: .topBarTrailing) {
                            Button("Add Player") {
                                guard let currentGame = gameSelection.currentGame else { return }
                                viewModel.player.game = currentGame
                                print(currentGame)
                                context.insert(viewModel.player)
                                gameSelection.findWinner = true
                                dismiss()
                            }
                            .foregroundStyle(.celadon)
                            .font(.custom("scrible", size: 20))
                            .padding()
                        }
                    }
                    .onAppear() {
                        viewModel.player.game = gameSelection.currentGame
                    }
                }
            }
        }
    }
}

#Preview {
    AddPlayerView()
        .modelContainer(for: [Game.self, Player.self])
        .environment(GameTrackorRouter())
        .environment(GameSelection())
}
