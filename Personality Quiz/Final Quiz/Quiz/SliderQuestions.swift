import SwiftUI

struct SliderQuestionMaker {
    let question: String
    let answers: [ClosedRange<Int>: House]
    let lowLabel: String
    let highLabel: String
    @State var amount: Int
}

struct SliderQuestion: View {
    var question: SliderQuestionMaker
    @Binding var results: [House]
    @State private var isEditing = false
    @State private var lastPick: House? = nil
    
    var body: some View {
        var amount = question.amount
        VStack(spacing: 24) {
            Text(question.question)
                .modifier(BigishWords())
                .padding()
            HStack {
                Text(question.lowLabel)
                Spacer()
                Text(question.highLabel)
            }
            .modifier(InfoCapsule())
            .padding(.vertical, -20)
            .padding(.bottom, -20)
            Slider(
                value: Binding(
                    get: { Double(amount) },
                    set: { newValue in
                        amount = Int(newValue)
                    }
                ),
                in: 0...100,
                onEditingChanged: { editing in
                    isEditing = editing
                    if !editing {
                        if let house = houseForValue(amount) {
                            if lastPick != nil {
                                results.remove(at: results.firstIndex(of: lastPick!)!)
                                print("Slider change \(amount): \(String(describing: lastPick)) removed")
                            }
                            results.append(house)
                            lastPick = house
                            print("Slider stopped at \(amount): \(house) added")
                        }
                    }
                }
            )
            .tint(.yellow)
            .padding()
        }
        .glassEffect(in: .rect(cornerRadius: 16.0))
        .padding()
    }

    func houseForValue(_ value: Int) -> House? {
        for (range, house) in question.answers {
            if range.contains(value) {
                return house
            }
        }
        return nil
    }
}
