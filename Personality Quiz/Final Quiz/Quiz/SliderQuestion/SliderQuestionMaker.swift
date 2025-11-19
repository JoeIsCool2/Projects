import SwiftUI

struct SliderQuestionMaker {
    let question: String
    let answers: [ClosedRange<Int>: House]
    let lowLabel: String
    let highLabel: String
    @State var amount: Int
}
