import Foundation

struct MultipleChoice: Identifiable, Hashable {
    let id = UUID()
    let question: String
    let answers: [String: House]
}
