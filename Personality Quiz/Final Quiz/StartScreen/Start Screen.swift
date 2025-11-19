import SwiftUI

struct StartScreen: View {
    @State private var viewModel = StartScreenViewModel()
    
    var body: some View {
        NavigationStack {
            ZStack {
                Image("BackgroundImage1")
                    .resizable()
                    .ignoresSafeArea()
                    .scaledToFill()
                
                VStack {
                    Text(viewModel.welcomeTitle)
                        .modifier(BigWords())
                    
                    Text(viewModel.introText)
                        .modifier(InfoCapsule())
                        .padding(.horizontal, 60)
                    
                    NavigationLink("Start Quiz →") {
                        viewModel.startQuiz()
                    }
                    .buttonStyle(ButtonCapsule())
                }
                .padding()
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    StartScreen()
}
