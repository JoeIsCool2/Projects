import SwiftUI
import Combine

struct SliderQuestion: View {
    var viewModel: SliderQuestionsViewModel
    let question: SliderQuestionMaker

    var body: some View {
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
                value: viewModel.bindingAmount(for: question),
                in: Double(viewModel.range.lowerBound)...Double(viewModel.range.upperBound),
                onEditingChanged: { editing in
                    viewModel.setEditing(editing)
                    if !editing {
                        viewModel.commitSelection(for: question)
                    }
                }
            )
            .tint(.yellow)
            .padding()
        }
        .glassEffect(in: .rect(cornerRadius: 16.0))
        .padding()
    }
}
