import SwiftUI

@Observable
final class QuizViewModel {
    var mcViewModel = MultipleChoiceQuestionsViewModel()
    var sliderViewModel = SliderQuestionsViewModel()
    var currentQuestion: Int = 0
}
