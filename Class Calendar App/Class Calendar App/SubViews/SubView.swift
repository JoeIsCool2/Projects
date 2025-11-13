import SwiftUI

struct SubView: View {
    let title: String
    let info: [String]
    let color: Color
    @State var isSubmitted: Bool
    @State var isComplete = "Not Finished"
    let randomColor = Color.random()
    let colorChange = FindColor()
    var textColor: Color {
        colorChange.findComplementaryColor(color: randomColor)
    }
    
    var body: some View {
        ZStack {
            Backround()
            VStack {
                Text(title)
                    .modifier(TitleText())
                ForEach(info, id: \.self) { item in
                    VStack {
                        MakeDayCapsule(title: isComplete, Info: item, color: color)
                    }
                    .animation(.easeOut(duration: 0.25), value: isComplete)
                }
                Button("Complete", action: submit)
                    .font(.custom("American Typewriter", size: 40))
                    .foregroundStyle(textColor)
                    .padding()
                    .background(
                        Capsule()
                            .fill(.clear)
                            .glassEffect(
                                .regular.tint(randomColor).interactive(),
                                in: .rect(cornerRadius: 30)
                            )
                            .overlay(
                                Capsule()
                                    .stroke(Color.black.opacity(0.2), lineWidth: 2)
                            )
                    )
            }
        }
    }
    func submit() {
        isSubmitted.toggle()
        if isSubmitted {
            isComplete = "Complete"
        } else {
            isComplete = "Not Finished"
        }
    }
}


