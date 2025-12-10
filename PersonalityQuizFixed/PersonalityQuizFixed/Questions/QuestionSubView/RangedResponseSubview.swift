import SwiftUI

struct RangedResponseSubview: View {
    let question: Question
    @State private var amount: Double = 0
    @State private var lastSelected: Answer? = nil
    @State private var hasInteracted = false
    @Environment(QuizManager.self) var quizManager
    
    var body: some View {
        ZStack {
            Image(.background)
                .resizable()
                .ignoresSafeArea()
            
            VStack {
                Spacer()
                
                Text(question.text)
                    .font(.custom("Impact", size: 40))
                    .foregroundStyle(.lightGoldenBrown)
                    .multilineTextAlignment(.center)
                    .padding()
                    .glassEffect(.regular.tint(.brownish).interactive(),
                                 in: .rect(cornerRadius: 16.0))
                    .padding()
                
                Slider(
                    value: $amount,
                    in: 0...Double(question.answers.count - 1),
                    step: 1
                ) {}
                .tint(.goldenBrown)
                
                HStack {
                    ForEach(question.answers, id: \.text) { answer in
                        Spacer()
                        Text(answer.text)
                            .font(.custom("", size: 20))
                            .foregroundStyle(.blackish)
                            .bold()
                        Spacer()
                    }
                }
                
                Spacer()
            }
            .onChange(of: amount) { newValue in
                hasInteracted = true
                if let last = lastSelected {
                    quizManager.deselectAnswer([last])
                    print("\(last.type) removed")
                }
                
                let newAnswer = question.answers[Int(newValue)]
                quizManager.selectAnswer([newAnswer])
                print("\(newAnswer.type) added")
                
                lastSelected = newAnswer
            }
            .onAppear {
                if !hasInteracted, lastSelected == nil, let first = question.answers.first {
                    amount = 0
                    quizManager.selectAnswer([first])
                    lastSelected = first
                    print("Defaulted to lowest: \(first.type)")
                }
            }
            .padding()
        }
    }
}

#Preview {
    RangedResponseSubview(question: Question(
        text: "Rate your preference for mentors who are strict vs. gentle.",
        type: .ranged,
        answers: [
            Answer(text: "Strict", type: .mcGonagall),
            Answer(text: "Balanced", type: .obiWan),
            Answer(text: "Gentle", type: .fredRogers),
            Answer(text: "Kind", type: .fredRogers),
            Answer(text: "Old", type: .gandalf)
        ]
    ))
    .environment(QuizManager())
}
