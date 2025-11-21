import SwiftUI

enum House {
    case Slytherin, Gryffindor, Hufflepuff, Ravenclaw
}

struct QuizView: View {
    // ViewModels for MVVM children
    @StateObject private var mcViewModel = MultipleChoiceQuestionsViewModel()
    @StateObject private var sliderViewModel = SliderQuestionsViewModel()

    // Local navigation state
    @State var currentQuestion = 0

    var body: some View {
        ZStack {
            Image("BackgroundImage1")
                .resizable()
                .ignoresSafeArea()
                .scaledToFill()
            VStack {
                if currentQuestion < multipleChoiceQuestions.count {
                    MultipleChoiceQuestion(
                        question: multipleChoiceQuestions[currentQuestion],
                        viewModel: mcViewModel
                    )
                } else if currentQuestion < (multipleChoiceQuestions.count + pickerQuestions.count) {
                    let pickerIndex = currentQuestion - multipleChoiceQuestions.count
                    PickerQuestion(
                        question: pickerQuestions[pickerIndex],
                        results: $sliderViewModel.results
                    )
                } else if currentQuestion < (multipleChoiceQuestions.count + pickerQuestions.count + sliderQuestions.count) {
                    let sliderIndex = currentQuestion - multipleChoiceQuestions.count - pickerQuestions.count
                    SliderQuestion(
                        viewModel: sliderViewModel,
                        question: sliderQuestions[sliderIndex]
                    )
                    .padding(50)
                } else {
                    Text("something broke")
                }
                HStack {
                    if currentQuestion > 0 {
                        Button("Back", action: backAQuesiton)
                            .buttonStyle(ButtonCapsule())
                    }
                    if currentQuestion < multipleChoiceQuestions.count + pickerQuestions.count + sliderQuestions.count - 1 {
                        Button("Next", action: nextQuesiton)
                            .buttonStyle(ButtonCapsule())
                    } else {
                        NavigationLink("Finish Quiz →", destination: EndScreen(viewModel: EndScreenViewModel(results: sliderViewModel.results)))
                            .buttonStyle(ButtonCapsule())
                    }
                }
            }
        }
    }

    func nextQuesiton() {
        currentQuestion += 1
    }
    func backAQuesiton() {
        currentQuestion -= 1
    }
}
