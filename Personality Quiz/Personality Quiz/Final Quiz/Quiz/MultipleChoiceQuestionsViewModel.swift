import Foundation
import SwiftUI
import Combine

final class MultipleChoiceQuestionsViewModel: ObservableObject {
    // Tracks all chosen answers' display text
    @Published var selectedAnswers: [String] = []
    // Tracks resulting houses from selections
    @Published var results: [House] = []

    func isSelected(_ answer: String) -> Bool {
        selectedAnswers.contains(answer)
    }

    func toggle(answer: String, for question: MultipleChoice) {
        guard let house = question.answers[answer] else { return }

        if let idx = selectedAnswers.firstIndex(of: answer) {
            // Deselect
            selectedAnswers.remove(at: idx)
            if let rIdx = results.firstIndex(of: house) {
                results.remove(at: rIdx)
            }
            print("\(answer) clicked: \(house) deselected")
        } else {
            // Select
            selectedAnswers.append(answer)
            results.append(house)
            print("\(answer) clicked: \(house) selected")
        }
    }
}
