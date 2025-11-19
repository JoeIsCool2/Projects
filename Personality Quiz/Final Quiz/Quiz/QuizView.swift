import SwiftUI
import Observation

struct QuizView: View {
    @State private var quizVM = QuizViewModel()
    
    var body: some View {
        ZStack {
            Image("BackgroundImage1")
                .resizable()
                .ignoresSafeArea()
                .scaledToFill()
            
            VStack {
                if quizVM.currentQuestion < quizVM.multipleChoiceQuestionsData.count {
                    MultipleChoiceQuestion(
                        question: quizVM.multipleChoiceQuestionsData[quizVM.currentQuestion]
                    )
                    .id(quizVM.currentQuestion)
                } else if quizVM.currentQuestion < (quizVM.multipleChoiceQuestionsData.count + quizVM.pickerQuestionsData.count) {
                    let pickerIndex = quizVM.currentQuestion - quizVM.multipleChoiceQuestionsData.count
                    PickerQuestion(
                        question: quizVM.pickerQuestionsData[pickerIndex]
                    )
                    .id(quizVM.currentQuestion)
                } else if quizVM.currentQuestion < (quizVM.multipleChoiceQuestionsData.count + quizVM.pickerQuestionsData.count + quizVM.sliderQuestionsData.count) {
                    let sliderIndex = quizVM.currentQuestion - quizVM.multipleChoiceQuestionsData.count - quizVM.pickerQuestionsData.count
                    SliderQuestion(
                        question: quizVM.sliderQuestionsData[sliderIndex]
                    )
                    .id(quizVM.currentQuestion)
                    .padding(50)
                } else {
                    Text("something broke")
                }
                
                HStack {
                    if quizVM.currentQuestion > 0 {
                        Button("Back") { quizVM.backQuestion() }
                            .buttonStyle(ButtonCapsule())
                    }
                    if quizVM.currentQuestion < quizVM.totalQuestions - 1 {
                        Button("Next") { quizVM.nextQuestion() }
                            .buttonStyle(ButtonCapsule())
                    } else {
                        NavigationLink("Finish Quiz →", destination: EndScreen(results: quizVM.results))
                            .buttonStyle(ButtonCapsule())
                    }
                }
            }
        }
    }
}
