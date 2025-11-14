import SwiftUI

struct EndScreen: View {
    @ObservedObject var viewModel: EndScreenViewModel

    var body: some View {
        ZStack {
            Image("BackgroundImage1")
                .resizable()
                .ignoresSafeArea()
                .scaledToFill()
            VStack {
                Spacer()
                Text("You are \(viewModel.winningHouseName)")
                    .modifier(BigWords())
                    .padding()
                Text(viewModel.descriptionText)
                    .modifier(BigishWords())
                    .padding()
                    .glassEffect(in: .rect(cornerRadius: 16.0))
                    .tint(.clear)
                    .padding()
                Spacer()
                NavigationLink("Redo", destination: StartScreen())
                    .buttonStyle(ButtonCapsule())
            }
        }
    }
}
