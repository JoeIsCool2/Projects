import SwiftUI
import Combine

struct Question {
    var text: String
    var type: ResponseType
    var answers: [Answer]
}
enum ResponseType {
    case single, multiple, ranged
}

@Observable
class Answer: Identifiable, Equatable {
    
    let id = UUID()
    let text: String
    let type: Mentor
    var isClicked: Bool = false
    
    init(text: String, type: Mentor) {
        self.text = text
        self.type = type
    }
    
    static func == (lhs: Answer, rhs: Answer) -> Bool {
        lhs.id == rhs.id
    }
}

enum Mentor: CaseIterable {
    case gandalf        // Lord of the Rings
    case dumbledore     // Harry Potter
    case yoda           // Star Wars
    case mcGonagall     // Harry Potter
    case obiWan         // Star Wars
    case mrMiyagi       // Karate Kid
    case professorX     // X-Men
    case hagrid         // Harry Potter
    case morpheus       // The Matrix
    case tedLasso       // Ted Lasso (modern TV icon)
    case fredRogers     // Mister Rogers (real-world cultural icon)
}
