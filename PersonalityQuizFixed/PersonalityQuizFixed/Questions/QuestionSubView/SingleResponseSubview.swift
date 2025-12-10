import SwiftUI

struct SingleResponseSubview: View {
    let question: Question
    @State private var selected: Answer? = nil
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
                
                VStack(spacing: 12) {
                    ForEach(question.answers) { answer in
                        Button {
                            if let last = selected {
                                quizManager.deselectAnswer([last])
                                print("\(last.type) removed")
                            }
                            quizManager.selectAnswer([answer])
                            selected = answer
                            print("\(answer.type) added")
                        } label: {
                            Text(answer.text)
                                .font(.custom("", size: 20))
                                .bold()
                                .padding()
                                .frame(maxWidth: .infinity)
                                .foregroundStyle(.lightGoldenBrown)
                                .glassEffect(.regular.tint(
                                    selected?.id == answer.id ? Color.goldenBrown : Color.brownGrey
                                ), in: .rect(cornerRadius: 16.0))
                        }
                    }
                }
                .padding(.horizontal)
                
                Spacer()
            }
            .padding()
        }
    }
}

#Preview {
    SingleResponseSubview(question: Question(
        text: "How do you prefer to be taught?",
        type: .single,
        answers: [
            Answer(text: "Through discipline and practice", type: .mrMiyagi),
            Answer(text: "With stern fairness and protection", type: .mcGonagall),
            Answer(text: "By nurturing diverse talents", type: .professorX),
            Answer(text: "Through patience and sacrifice", type: .obiWan)
        ]
    ))
    .environment(QuizManager())
}
