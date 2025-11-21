import Foundation

struct SliderQuestionMaker: Identifiable, Hashable {
    let id = UUID()
    let question: String
    let answers: [ClosedRange<Int>: House]
    let lowLabel: String
    let highLabel: String
    let defaultAmount: Int
}
