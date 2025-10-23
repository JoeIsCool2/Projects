import SwiftUI
struct EndScreen: View {
    @Binding var results: [House]
    @State private var gryffindorCount = 0
    @State private var slytherinCount = 0
    @State private var hufflepuffCount = 0
    @State private var ravenclawCount = 0
    @State private var allHouseCount: [House:Int] = [:]
    
    var body: some View {
        ZStack {
            Image("BackgroundImage1")
                .resizable()
                .ignoresSafeArea()
                .scaledToFill()
            VStack {
                Spacer()
                let result = findHouse(from: results)
                Text("You are \(result)")
                    .modifier(BigWords())
                    .padding()
                Spacer()
                NavigationLink("Redo", destination: StartScreen())
                    .buttonStyle(ButtonCapsule())
            }
        }
    }
}

func findHouse(from results: [House]) -> String {
    var allHouseCount: [House: Int] = [
        .Gryffindor: 0,
        .Slytherin: 0,
        .Hufflepuff: 0,
        .Ravenclaw: 0
    ]

    for house in results {
        allHouseCount[house, default: 0] += 1
    }

    let sorted = allHouseCount.sorted { $0.value > $1.value }
    let result = sorted.first?.key
    switch result {
        case .Gryffindor: return "Gryffindor"
        case .Slytherin: return "Slytherin"
        case .Hufflepuff: return "Hufflepuff"
        case .Ravenclaw: return "Ravenclaw"
        default: return "Muggle"
    }
}


