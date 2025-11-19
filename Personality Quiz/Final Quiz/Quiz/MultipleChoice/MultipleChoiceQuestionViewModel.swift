import SwiftUI

@Observable
class MultipleChoiceQuestionViewModel {
    var question: MultipleChoice
    var selectedAnswer: String? = nil
    var selectedAnswers: [String?] = []
    var results: [House] = []

    init(question: MultipleChoice, results: [House] = []) {
        self.question = question
        self.results = results
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
        } else {
            selectedAnswer = answer
            selectedAnswers.append(answer)
            results.append(indication)
        }
    }
}

