import SwiftUI
import SwiftData
import Combine

struct AddGameView: View {
    @State var viewModel = AddGameViewModel()
    @Environment(\.dismiss) var dismiss
    let game: Game?
    @Environment(GameSelection.self) var gameSelection
    @Query(sort: \Game.createdAt, order: .reverse) var games: [Game]
    @Environment(\.modelContext) var context
    @Query(sort: \Player.score, order: .forward) private var players: [Player]
    @Namespace private var animate
    
    
    var sortedPlayers: [Player] {
        // Filter players to only show those belonging to this specific game
        let gamePlayers = players.filter { $0.game?.id == viewModel.game.id }
        switch viewModel.sortBy {
        case .HighestScore:
            return gamePlayers.sorted { $0.score > $1.score }
        case .LowestScore:
            return gamePlayers.sorted { $0.score < $1.score }
        }
    }
    
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
        ZStack {
            Color.midnightViolet.ignoresSafeArea()
            
            VStack {
                // FIXED: Displays the winner directly from the ACTUAL game model
//                if let winnerName = viewModel.game.winner?.name {
//                    Text("Winner: \(winnerName)")
//                        .font(.custom("scrible", size: 30))
//                        .foregroundStyle(.celadon)
//                        .padding(.top)
//                }
                
                // Wrap the header in a container to receive matchedGeometryEffect for add button card
                VStack {
                    TextField("Name Of Game", text: $viewModel.game.name)
                        .foregroundStyle(.midnightBlue)
                        .font(.custom("scrible", size: 40))
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 20)
                                .fill(.celadon)
                                .matchedGeometryEffect(id: "add-card", in: animate)
                        )
                        .padding()
                        .tint(.midnightBlue)
                        .matchedGeometryEffect(id: viewModel.isAdding, in: animate)
                }
                
                ScrollView(.vertical) {
                    HStack {
                        Text("Game Symbole:")
                            .foregroundStyle(.slateGrey)
                        Image(systemName: viewModel.game.icon.rawValue)
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
                                    viewModel.game.icon = icon
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
                    
                    HStack {
                        Text("Sort By: ")
                            .foregroundStyle(.slateGrey)
                        Text(viewModel.sortBy.rawValue)
                            .foregroundStyle(.celadonDark)
                        Spacer()
                    }
                    .font(.custom("scrible", size: 20))
                    .padding()
                    
                    Picker("Sort Players By:", selection: $viewModel.sortBy) {
                        ForEach(SortTypes.allCases, id: \.self) { sort in
                            Text(sort.rawValue).tag(sort)
                        }
                    }
                    .pickerStyle(.palette)
                    .background(RoundedRectangle(cornerRadius: 12).fill(Color.slateGrey))
                    .padding(.horizontal)
                    .onChange(of: viewModel.sortBy) { _, newValue in
                        if viewModel.game.sortBy != newValue {
                            viewModel.game.sortBy = newValue
                        }
                    }
                    
                    HStack {
                        Text("Select Winner By: ")
                            .foregroundStyle(.slateGrey)
                        Text(viewModel.selectWinnerBy.rawValue)
                            .foregroundStyle(.celadonDark)
                        Spacer()
                    }
                    .font(.custom("scrible", size: 20))
                    .padding()
                    
                    Picker("Select Winner By:", selection: $viewModel.selectWinnerBy) {
                        ForEach(SortTypes.allCases, id: \.self) { sort in
                            Text(sort.rawValue).tag(sort)
                        }
                    }
                    .pickerStyle(.palette)
                    .background(RoundedRectangle(cornerRadius: 12).fill(Color.slateGrey))
                    .padding(.horizontal)
                    .onChange(of: viewModel.selectWinnerBy) { _, newValue in
                        if viewModel.game.selectWinnerBy != newValue {
                            viewModel.game.selectWinnerBy = newValue
                            // Update winner immediately when rules change
                            viewModel.game.winner = viewModel.findWinner(game: viewModel.game, players: players)
                        }
                    }
                    
                    Text("Players")
                        .foregroundStyle(.celadonDark)
                        .font(.custom("scrible", size: 30))
                        .bold()
                        .padding()
                    
                    ScrollView {
                        let currentPlayers = sortedPlayers
                        if currentPlayers.count > 0 {
                            ForEach(currentPlayers) { player in
                                HStack {
                                    Image(systemName: player.icon.rawValue)
                                        .scaleEffect(1.5)
                                    Text("\(player.name):")
                                    Spacer()
                                    Stepper("\(player.score)",
                                            onIncrement: { player.score += 1 },
                                            onDecrement: { player.score -= 1 })
                                    Button {
                                        delete(player: player)
                                    } label: {
                                        Image(systemName: "trash.fill")
                                            .foregroundStyle(.red.opacity(0.7))
                                    }
                                }
                                .font(.custom("scrible", size: 20))
                                .foregroundStyle(.celadon)
                                .padding()
                                .background(Capsule().fill(.midnightBlue).shadow(color: .slateGrey, radius: 5))
                                .padding(.horizontal)
                                .onChange(of: player.score) {
                                    viewModel.game.winner = viewModel.findWinner(game: viewModel.game, players: players)
                                }
                            }
                        } else {
                            Text("No Players Added")
                                .foregroundStyle(.slateGrey)
                                .font(.custom("scrible", size: 20))
                        }
                    }
                }
                
                if gameSelection.currentGame != nil {
                    Button {
                        viewModel.isAdding = true
                    } label: {
                        Text("Add Player")
                            .font(.custom("scrible", size: 30))
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 20).fill(.celadon))
                            .foregroundStyle(.midnightBlue)
                    }
                    .padding()
                }
            }
        }
        // FIXED: This ensures the ACTUAL game is updated when any score changes
        .onChange(of: players) {
            viewModel.game.winner = viewModel.findWinner(game: viewModel.game, players: players)
        }
        .sheet(isPresented: $viewModel.isAdding) {
            AddPlayerView()
        }
        .toolbar {
            if viewModel.isNewGame {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Add Game") {
                        context.insert(viewModel.game)
                        viewModel.game.winner = viewModel.findWinner(game: viewModel.game, players: players)
                        dismiss()
                    }
                }
            }
        }
        .onAppear {
            if let game = game {
                viewModel.game = game
                viewModel.selectedIcon = game.icon
                viewModel.isNewGame = false
                
                // Fixed: Prevents crash if database values were nil
                viewModel.sortBy = game.sortBy ?? .HighestScore
                viewModel.selectWinnerBy = game.selectWinnerBy ?? .HighestScore
                
                viewModel.game.winner = viewModel.findWinner(game: viewModel.game, players: players)
            } else {
                viewModel.isNewGame = true
            }
            gameSelection.currentGame = viewModel.game
        }
    }
    
    func delete(player: Player) {
        withAnimation {
            context.delete(player)
        }
    }
}
#Preview {
    AddGameView(game: nil)
        .modelContainer(for: [Game.self, Player.self])
        .environment(GameTrackorRouter())
        .environment(GameSelection())
}
