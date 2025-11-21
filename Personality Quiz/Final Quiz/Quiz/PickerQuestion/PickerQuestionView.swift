import SwiftUI
import Combine

struct PickerQuestion: View {
    @State private var vm: PickerQuestionViewModel

    init(question: PickerQuestionModel, results: Binding<[House]>) {
        _vm = State(wrappedValue: PickerQuestionViewModel(model: question, results: results))
    }

    var body: some View {
        VStack(spacing: 16) {
            Text(vm.prompt)
                .modifier(BigishWords())

            ForEach(vm.answerTitles, id: \.self) { answer in
                Button(action: {
                    vm.chooseAnswer(answer)
                }) {
                    Text(answer)
                        .font(.system(size: 17, weight: .bold, design: .serif))
                        .foregroundColor(.white)
                        .padding(.horizontal, 24)
                        .padding(.vertical, 12)
                        .background(vm.isSelected(answer) ? Color.yellow : Color.black.opacity(0.2))
                        .cornerRadius(16)
                        .overlay(
                            RoundedRectangle(cornerRadius: 16)
                                .stroke(vm.isSelected(answer) ? Color.orange : Color.clear, lineWidth: 2)
                        )
                        .scaleEffect(vm.isSelected(answer) ? 1.05 : 1.0)
                        .shadow(color: vm.isSelected(answer) ? Color.orange.opacity(0.6) : Color.clear, radius: 6, x: 0, y: 3)
                        .animation(.easeInOut(duration: 0.2), value: vm.selectedAnswer)
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
