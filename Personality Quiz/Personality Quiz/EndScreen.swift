import SwiftUI

struct EndScreen: View {
    @Binding var results: [options]
    @Binding var currentQuestion: Int
    @Binding var isStarted: Bool
    
    private var griCount: Int { results.filter { $0 == .gri }.count }
    private var hufCount: Int { results.filter { $0 == .huf }.count }
    private var ravCount: Int { results.filter { $0 == .rav }.count }
    private var sliCount: Int { results.filter { $0 == .sli }.count }
    
    private var resultImageName: String {
        if griCount > hufCount && griCount > ravCount && griCount > sliCount {
            return "grifendore"
        } else if hufCount > ravCount && hufCount > sliCount {
            return "huffpuff"
        } else if ravCount > sliCount {
            return "ravenclaw"
        } else if sliCount > 0 {
            return "slitherin"
        } else {
            return ""
        }
    }
    
    private var resultTitle: String {
        if griCount > hufCount && griCount > ravCount && griCount > sliCount {
            return "You are Gryffindor"
        } else if hufCount > ravCount && hufCount > sliCount {
            return "You are Hufflepuff"
        } else if ravCount > sliCount {
            return "You are Ravenclaw"
        } else if sliCount > 0 {
            return "You are Slytherin"
        } else {
            return "It broke"
        }
    }
    
    var body: some View {
        VStack(spacing: 12) {
            Text(resultTitle)
            .font(.custom("Impact", size: 67))
            .bold()
            
            Image(resultImageName)
                .resizable()
                .scaledToFit()
                .border(Color.black, width: 5)
            
            Button("Restart") {
                results = []
                currentQuestion = 0
            }
            .padding()
            .frame(maxWidth: .infinity)
            .glassEffect(in: .rect)
            .tint(.blue)
            .foregroundColor(.primary)
            .cornerRadius(10)
        }
        .padding()
    }
}
