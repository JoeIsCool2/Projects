import SwiftUI

struct MultipleResponseSubview: View {
    let question: Question
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
                Text("(Select as many as you want)")
                    .foregroundStyle(.blackish)
                ScrollView {
                    ForEach(question.answers, id: \.id) { answer in
                        Button {
                            answer.isClicked.toggle()
                            
                            if answer.isClicked {
                                quizManager.selectAnswer([answer])
                                print("\(answer.type) added")
                            } else {
                                quizManager.deselectAnswer([answer])
                                print("\(answer.type) removed")
                            }
                        } label: {
                            Text(answer.text)
                                .frame(maxWidth: .infinity)
                                .font(.custom("", size: 20))
                                .bold()
                                .padding()
                                .foregroundStyle(.lightGoldenBrown)
                                .glassEffect(.regular.tint(
                                    answer.isClicked ? Color.goldenBrown : Color.brownGrey
                                ), in: .rect(cornerRadius: 16.0))
                        }
                    }
                }
                .padding()
                Spacer()
            }
            .padding()
        }
    }
}

#Preview {
    MultipleResponseSubview(question: Question(
        text: "How do you handle challenges?",
        type: .multiple,
        answers: [
            Answer(text: "Seek wisdom from experience", type: .gandalf),
            Answer(text: "Stay optimistic and encourage others", type: .tedLasso),
            Answer(text: "Strategize and plan ahead", type: .dumbledore),
            Answer(text: "Push through with discipline", type: .mrMiyagi)
        ]
    ))
    .environment(QuizManager())
}
