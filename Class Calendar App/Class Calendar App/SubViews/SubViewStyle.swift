import SwiftUI

struct MakeSubViewCapsule: View {
    let Info: String
    let color: Color
    let colorChange = FindColor()
    var textColor: Color {
        colorChange.findComplementaryColor(color: color)
    }
    @State var isSubmitted: Bool
    @State var isComplete = "Not Finished"
    
    var body: some View {
        VStack {
            Text(isComplete)
                .font(.custom("American Typewriter", size: 40))
                .foregroundStyle(textColor)
                .padding()
                .background(
                    Capsule()
                        .fill(color)
                        .glassEffect(
                            .regular.tint(.clear),
                            in: .rect(cornerRadius: 30)
                        )
                )
            Text(Info)
                .foregroundStyle(textColor)
                .font(.custom("American Typewriter", size: 20))
                .multilineTextAlignment(.center)
                .truncationMode(.tail)
                .transition(.opacity)
        }
        .padding()
        .background (
            Capsule()
                .fill(.clear)
                .glassEffect(
                    .regular.tint(color).interactive(),
                    in: .rect(cornerRadius: 30)
                )
        )
        .padding()
    }
}
