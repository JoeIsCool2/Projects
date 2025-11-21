import SwiftUI

@Observable
final class PickerQuestionViewModel {
    let prompt: String
    let answers: [String: House]
    @ObservationIgnored @Binding var results: [House]
    
    var selectedAnswer: String? = nil

    init(model: PickerQuestionModel, results: Binding<[House]>) {
        self.prompt = model.prompt
        self.answers = model.answers
        self._results = results
    }

    func chooseAnswer(_ answer: String) {
        guard let house = answers[answer] else { return }
        if selectedAnswer == answer {
            selectedAnswer = nil
            if let index = results.firstIndex(of: house) {
                results.remove(at: index)
            }
            print("\(answer) clicked: \(house) deselected")
        } else {
            selectedAnswer = answer
            results.append(house)
            print("\(answer) clicked: \(house) selected")
        }
    }

    var answerTitles: [String] { Array(answers.keys) }
    func isSelected(_ answer: String) -> Bool { selectedAnswer == answer }
}
