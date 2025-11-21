import SwiftUI

enum House {
    case Slytherin, Gryffindor, Hufflepuff, Ravenclaw
}

struct QuizView: View {
    // Single observable view model owning quiz state
    @State private var viewModel = QuizViewModel()

    var body: some View {
        ZStack {
            Image("BackgroundImage1")
                .resizable()
                .ignoresSafeArea()
                .scaledToFill()
            VStack {
                if viewModel.currentQuestion < multipleChoiceQuestions.count {
                    MultipleChoiceQuestion(
                        question: multipleChoiceQuestions[viewModel.currentQuestion],
                        viewModel: viewModel.mcViewModel
                    )
                } else if viewModel.currentQuestion < (multipleChoiceQuestions.count + pickerQuestions.count) {
                    let pickerIndex = viewModel.currentQuestion - multipleChoiceQuestions.count
                    PickerQuestion(
                        question: pickerQuestions[pickerIndex],
                        results: $viewModel.sliderViewModel.results
                    )
                } else if viewModel.currentQuestion < (multipleChoiceQuestions.count + pickerQuestions.count + sliderQuestions.count) {
                    let sliderIndex = viewModel.currentQuestion - multipleChoiceQuestions.count - pickerQuestions.count
                    SliderQuestion(
                        viewModel: viewModel.sliderViewModel,
                        question: sliderQuestions[sliderIndex]
                    )
                    .padding(50)
                } else {
                    Text("something broke")
                }
                HStack {
                    if viewModel.currentQuestion > 0 {
                        Button("Back", action: backAQuesiton)
                            .buttonStyle(ButtonCapsule())
                    }
                    if viewModel.currentQuestion < multipleChoiceQuestions.count + pickerQuestions.count + sliderQuestions.count - 1 {
                        Button("Next", action: nextQuesiton)
                            .buttonStyle(ButtonCapsule())
                    } else {
                        NavigationLink("Finish Quiz →", destination: EndScreen(viewModel: EndScreenViewModel(results: viewModel.sliderViewModel.results)))
                            .buttonStyle(ButtonCapsule())
                    }
                }
            }
        }
    }

    func nextQuesiton() {
        viewModel.currentQuestion += 1
    }
    func backAQuesiton() {
        viewModel.currentQuestion -= 1
    }
}
