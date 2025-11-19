import SwiftUI
import Observation

struct EndScreen: View {
    @State private var viewModel = QuizViewModel()
    
    var body: some View {
        ZStack {
            Image("BackgroundImage1")
                .resizable()
                .ignoresSafeArea()
                .scaledToFill()
            VStack {
                Spacer()
                Text("You are \(viewModel.resolvedHouse.name)")
                    .modifier(BigWords())
                    .padding()
                Text(viewModel.resolvedHouse.description)
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
