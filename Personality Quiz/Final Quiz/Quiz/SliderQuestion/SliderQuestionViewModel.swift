import SwiftUI
import Observation

@Observable
class SliderQuestionViewModel {
    var question: SliderQuestionMaker
    var results: [House] = []
    var selectedSliderQuestion: [String: Int] = [:]
    var isEditing = false
    var lastPick: House? = nil
    
    init(question: SliderQuestionMaker, results: [House] = [], selectedSliderQuestion: [String: Int] = [:]) {
        self.question = question
        self.results = results
        self.selectedSliderQuestion = selectedSliderQuestion
    }
    
    func updateSlider(value: Int, editing: Bool) {
        isEditing = editing
        if !editing {
            if let house = houseForValue(value) {
                if let last = lastPick, let index = results.firstIndex(of: last) {
                    results.remove(at: index)
                    print("Slider change \(value): \(last) removed")
                }
                results.append(house)
                selectedSliderQuestion[question.question] = value
                lastPick = house
                print("Slider stopped at \(value): \(house) added")
            }
        }
    }
    
    private func houseForValue(_ value: Int) -> House? {
        for (range, house) in question.answers {
            if range.contains(value) {
                return house
            }
        }
        return nil
    }
}
