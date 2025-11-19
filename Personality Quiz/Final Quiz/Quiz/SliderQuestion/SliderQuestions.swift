import SwiftUI

struct SliderQuestion: View {
    @State private var viewModel: SliderQuestionViewModel
    
    init(question: SliderQuestionMaker, results: [House] = [], selectedSliderQuestion: [String: Int] = [:]) {
        _viewModel = State(initialValue: SliderQuestionViewModel(question: question, results: results, selectedSliderQuestion: selectedSliderQuestion))
    }
    
    var body: some View {
        let amount = viewModel.selectedSliderQuestion[viewModel.question.question] ?? viewModel.question.amount
        
        VStack(spacing: 24) {
            Text(viewModel.question.question)
                .modifier(BigishWords())
                .padding()
            
            HStack {
                Text(viewModel.question.lowLabel)
                Spacer()
                Text(viewModel.question.highLabel)
            }
            .modifier(InfoCapsule())
            .padding(.vertical, -20)
            .padding(.bottom, -20)
            
            Slider(
                value: Binding(
                    get: { Double(amount) },
                    set: { newValue in
                        viewModel.selectedSliderQuestion[viewModel.question.question] = Int(newValue)
                    }
                ),
                in: 0...100,
                onEditingChanged: { editing in
                    let value = viewModel.selectedSliderQuestion[viewModel.question.question] ?? viewModel.question.amount
                    viewModel.updateSlider(value: value, editing: editing)
                }
            )
            .tint(.yellow)
            .padding()
        }
        .glassEffect(in: .rect(cornerRadius: 16.0))
        .padding()
    }
}
