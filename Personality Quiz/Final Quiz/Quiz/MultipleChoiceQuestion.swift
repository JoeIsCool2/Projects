import SwiftUI

struct MultipleChoice {
    let question: String
    let answers: [String: House]
}

struct MultipleChoiceQuestion: View {
    let question: MultipleChoice
    @Binding var selectedAnswers: [String?]
    @State private var selectedAnswer: String? = nil
    @Binding var results: [House]
    
    var body: some View {
        VStack(spacing: 16) {
            Text(question.question)
                .modifier(BigishWords())
            
            ForEach(Array(question.answers.keys), id: \.self) { answer in
                Button(action: {
                    chooseAnswer(answer: answer, indication: question.answers[answer]!)
                }) {
                    Text(answer)
                        .font(.system(size: 17, weight: .bold, design: .serif))
                        .foregroundColor(.white)
                        .padding(.horizontal, 24)
                        .padding(.vertical, 12)
                        .background(selectedAnswer == answer || selectedAnswers.contains(answer) ? Color.yellow : Color.black.opacity(0.2))
                        .cornerRadius(16)
                        .overlay(
                            RoundedRectangle(cornerRadius: 16)
                                .stroke(selectedAnswer == answer || selectedAnswers.contains(answer) ? Color.orange : Color.clear, lineWidth: 2)
                        )
                        .scaleEffect(selectedAnswer == answer || selectedAnswers.contains(answer) ? 1.05 : 1.0)
                        .shadow(color: selectedAnswer == answer || selectedAnswers.contains(answer) ? Color.orange.opacity(0.6) : Color.clear, radius: 6, x: 0, y: 3)
                        .animation(.easeInOut(duration: 0.2), value: selectedAnswer == answer)
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
    
    func chooseAnswer(answer: String, indication: House) {
        if selectedAnswer == answer || selectedAnswers.contains(answer) {
            selectedAnswer = nil
            if let index = selectedAnswers.firstIndex(of: answer) {
                selectedAnswers.remove(at: index)
            }
            if let index = results.firstIndex(of: indication) {
                results.remove(at: index)
            }
            print("\(answer) clicked: \(indication) deselected")
        } else {
            selectedAnswer = answer
            selectedAnswers.append(answer)
            results.append(indication)
            print("\(answer) clicked: \(indication) selected")
        }
    }
}
