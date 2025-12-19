import SwiftUI

// Inside GameTableCapsule.swift

struct GameTableCapsule: View {
    let game: Game
    @Namespace private var animate
    @State var viewModel = GameTableViewModel()
    
    var body: some View {
        HStack {
            Image(systemName: game.icon.rawValue)
                .scaleEffect(2)
                .padding(5)
            Text(game.name)
                //.font(.custom("copperplate", size: 30)) // specific font might not render in preview, using system for safety
                .font(.system(size: 30, design: .serif))
                .padding(.horizontal)
                .matchedGeometryEffect(id: viewModel.isAddingGame, in: animate)
            Spacer()
            VStack {
                if let winner = game.winner {
                    Text("Winner:")
                        .font(.custom("scrible", size: 20))
                        .padding(.horizontal)
                    Text("\(winner.name)")
                        .font(.custom("scrible", size: 20))
                        .padding(.horizontal)
                }
            }
            .padding(.horizontal, -20)
        }
        .foregroundStyle(.midnightBlue)
        .font(.custom("scrible", size: 20))
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(.celadon)
        )
        .contentShape(Rectangle()) // Ensures the whole area is tappable
        // DELETE the .onTapGesture here.
        // Let the parent Button in GameTableView handle the tap.
    }
}

