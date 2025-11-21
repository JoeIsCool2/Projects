import Foundation
import SwiftUI
import Combine

// ViewModel to manage slider question state and results in MVVM style
final class SliderQuestionsViewModel: ObservableObject {
    // Published properties for UI bindings
    @Published var results: [House] = []
    @Published var selectedValues: [String: Int] = [:]
    @Published var isEditing: Bool = false
    @Published var lastPick: House? = nil

    // Default slider bounds; adjust as needed
    let range: ClosedRange<Int> = 0...100

    init(results: [House] = [], selectedValues: [String: Int] = [:]) {
        self.results = results
        self.selectedValues = selectedValues
    }

    func amount(for question: SliderQuestionMaker) -> Int {
        selectedValues[question.question] ?? question.defaultAmount
    }

    func bindingAmount(for question: SliderQuestionMaker) -> Binding<Double> {
        Binding<Double>(
            get: { Double(self.amount(for: question)) },
            set: { newValue in
                self.selectedValues[question.question] = Int(newValue)
            }
        )
    }

    func setEditing(_ editing: Bool) {
        isEditing = editing
    }

    func commitSelection(for question: SliderQuestionMaker) {
        let value = amount(for: question)
        guard let house = houseForValue(value, in: question.answers) else { return }

        if let last = lastPick, let idx = results.firstIndex(of: last) {
            results.remove(at: idx)
        }
        results.append(house)
        selectedValues[question.question] = value
        lastPick = house
    }

    func houseForValue(_ value: Int, in mapping: [ClosedRange<Int>: House]) -> House? {
        for (range, house) in mapping {
            if range.contains(value) { return house }
        }
        return nil
    }
}
