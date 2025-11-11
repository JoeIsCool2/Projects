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
                Text("You are \(result[0])")
                    .modifier(BigWords())
                    .padding()
                Text("\(result[1])")
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

func findHouse(from results: [House]) -> [String] {
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
    case .Gryffindor:
        return ["Gryffindor", "Brave, daring, and chivalrous. Known for courage and strong moral compass."]
    case .Slytherin:
        return ["Slytherin", "Ambitious, cunning, and resourceful. Values leadership and self-preservation."]
    case .Hufflepuff:
        return ["Hufflepuff", "Loyal, patient, and fair. Champions hard work and kindness."]
    case .Ravenclaw:
        return ["Ravenclaw", "Wise, witty, and curious. Celebrates intellect and creativity."]
    default:
        return ["Muggle", "Non-magical folk, living outside the wizarding world."]
    }
}


