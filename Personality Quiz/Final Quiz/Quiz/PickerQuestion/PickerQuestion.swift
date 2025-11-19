import SwiftUI

struct PickerQuestion: View {
    @State private var viewModel: PickerQuestionViewModel
    
    init(question: PickerQuestionMaker, results: [House] = []) {
        _viewModel = State(initialValue: PickerQuestionViewModel(question: question, results: results))
    }
    
    var body: some View {
        VStack(spacing: 16) {
            Text(viewModel.question.question)
                .modifier(BigishWords())
            
            ForEach(Array(viewModel.question.answers.keys), id: \.self) { answer in
                Button(action: {
                    viewModel.chooseAnswer(
                        answer: answer,
                        indication: viewModel.question.answers[answer]!
                    )
                }) {
                    Text(answer)
                        .font(.system(size: 17, weight: .bold, design: .serif))
                        .foregroundColor(.white)
                        .padding(.horizontal, 24)
                        .padding(.vertical, 12)
                        .background(viewModel.selectedAnswer == answer || viewModel.selectedAnswers.contains(answer) ? Color.yellow : Color.black.opacity(0.2))
                        .cornerRadius(16)
                        .overlay(
                            RoundedRectangle(cornerRadius: 16)
                                .stroke(viewModel.selectedAnswer == answer || viewModel.selectedAnswers.contains(answer) ? Color.orange : Color.clear, lineWidth: 2)
                        )
                        .scaleEffect(viewModel.selectedAnswer == answer || viewModel.selectedAnswers.contains(answer) ? 1.05 : 1.0)
                        .shadow(color: viewModel.selectedAnswer == answer || viewModel.selectedAnswers.contains(answer) ? Color.orange.opacity(0.6) : Color.clear, radius: 6, x: 0, y: 3)
                        .animation(.easeInOut(duration: 0.2), value: viewModel.selectedAnswer == answer)
                }
                .buttonStyle(PlainButtonStyle())
            }
            .padding(.horizontal)
            .padding(.vertical, 5)
        }
        .glassEffect(in: .rect(cornerRadius: 16.0))
        .padding(.horizontal, 30)
        .padding()
    }
}
