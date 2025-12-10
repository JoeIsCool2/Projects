import SwiftUI

struct QuestionFlowView: View {
    let question: Question
    @Environment(QuizManager.self) var quizManager
    
    var body: some View {
        ZStack {
            Image(.background)
                .resizable()
                .ignoresSafeArea()
            
            VStack {
                switch question.type {
                case .single:
                    SingleResponseSubview(question: question)
                case .multiple:
                    MultipleResponseSubview(question: question)
                case .ranged:
                    RangedResponseSubview(question: question)
                }
                
                if let currentIndex = quizManager.questionList.firstIndex(where: { $0.text == question.text }) {
                    let nextIndex = currentIndex + 1
                    if nextIndex < quizManager.questionList.count {
                        NavigationLink("Next") {
                            QuestionFlowView(question: quizManager.questionList[nextIndex])
                        }
                        .bold()
                        .foregroundStyle(.lightGoldenBrown)
                        .padding()
                        .glassEffect(.regular.tint(.brownish).interactive(), in: .rect(cornerRadius: 16.0))
                    } else {
                        NavigationLink("See Results") {
                            ResultsView()
                        }
                        .bold()
                        .foregroundStyle(.lightGoldenBrown)
                        .padding()
                        .glassEffect(.regular.tint(.brownish).interactive(), in: .rect(cornerRadius: 16.0))
                    }
                }
            }
        }
    }
}
