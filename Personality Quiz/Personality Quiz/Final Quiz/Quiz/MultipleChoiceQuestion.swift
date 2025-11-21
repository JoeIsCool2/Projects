import SwiftUI

struct MultipleChoice: Identifiable, Hashable {
    let id = UUID()
    let question: String
    let answers: [String: House]
}

struct MultipleChoiceQuestion: View {
    let question: MultipleChoice
    @ObservedObject var viewModel: MultipleChoiceQuestionsViewModel

    var body: some View {
        VStack(spacing: 16) {
            Text(question.question)
                .modifier(BigishWords())

            ForEach(Array(question.answers.keys), id: \.self) { answer in
                Button(action: {
                    viewModel.toggle(answer: answer, for: question)
                }) {
                    Text(answer)
                        .font(.system(size: 17, weight: .bold, design: .serif))
                        .foregroundColor(.white)
                        .padding(.horizontal, 24)
                        .padding(.vertical, 12)
                        .background(viewModel.isSelected(answer) ? Color.yellow : Color.black.opacity(0.2))
                        .cornerRadius(16)
                        .overlay(
                            RoundedRectangle(cornerRadius: 16)
                                .stroke(viewModel.isSelected(answer) ? Color.orange : Color.clear, lineWidth: 2)
                        )
                        .scaleEffect(viewModel.isSelected(answer) ? 1.05 : 1.0)
                        .shadow(color: viewModel.isSelected(answer) ? Color.orange.opacity(0.6) : Color.clear, radius: 6, x: 0, y: 3)
                        .animation(.easeInOut(duration: 0.2), value: viewModel.isSelected(answer))
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
