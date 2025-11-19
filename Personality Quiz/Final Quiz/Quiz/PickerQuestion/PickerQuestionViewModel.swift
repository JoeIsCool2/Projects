import SwiftUI
import Observation

@Observable
class PickerQuestionViewModel {
    var question: PickerQuestionMaker
    var selectedAnswers: [String?] = []
    var selectedAnswer: String? = nil
    var results: [House] = []
    
    init(question: PickerQuestionMaker, results: [House] = []) {
        self.question = question
        self.results = results
    }
    
    func chooseAnswer(answer: String, indication: House) {
        if selectedAnswer == answer {
            selectedAnswer = nil
            if let index = results.firstIndex(of: indication) {
                results.remove(at: index)
            }
            print("Removed answer: \(answer)")
        } else {
            selectedAnswer = answer
            results.append(indication)
            print("Selected answer: \(answer)")
        }
    }
}
