import SwiftUI

struct EndScreen: View {
    @State private var viewModel: EndScreenViewModel
    
    init(results: [House]) {
        _viewModel = State(initialValue: EndScreenViewModel(results: results))
    }
    
    var body: some View {
        ZStack {
            Image("BackgroundImage1")
                .resizable()
                .ignoresSafeArea()
                .scaledToFill()
            
            VStack {
                Spacer()
                
                let result = viewModel.finalResult()
                Text("You are \(result.house)")
                    .modifier(BigWords())
                    .padding()
                
                Text(result.description)
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

#Preview {
    EndScreen(results: [.Gryffindor, .Ravenclaw, .Gryffindor])
}
