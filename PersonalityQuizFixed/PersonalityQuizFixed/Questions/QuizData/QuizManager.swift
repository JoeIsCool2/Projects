import SwiftUI

@Observable
class QuizManager {
    var selectedAnswers: [Answer] = []
    
    let questionList: [Question] = [

        Question(
            text: "How structured do you want your mentor to be?",
            type: .ranged,
            answers: [
                Answer(text: "Strict", type: .mcGonagall),
                Answer(text: "Expectations", type: .obiWan),
                Answer(text: "Gentle", type: .mrMiyagi),
                Answer(text: "Soft", type: .fredRogers)
            ]
        ),

        Question(
            text: "What level of philosophy do you want from your mentor?",
            type: .ranged,
            answers: [
                Answer(text: "Pure", type: .tedLasso),
                Answer(text: "Realistic", type: .professorX),
                Answer(text: "Spiritual", type: .yoda),
                Answer(text: "Mythic", type: .gandalf)
            ]
        ),

        Question(
            text: "How should your mentor speak to you?",
            type: .multiple,
            answers: [
                Answer(text: "Direct and clear", type: .mcGonagall),
                Answer(text: "Encouraging and uplifting", type: .tedLasso),
                Answer(text: "Calm and gentle", type: .fredRogers),
                Answer(text: "Metaphorical or cryptic", type: .yoda)
            ]
        ),

        Question(
            text: "Pick the emotional tone you want most in a mentor.",
            type: .single,
            answers: [
                Answer(text: "Warm and supportive", type: .hagrid),
                Answer(text: "Calm and steady", type: .obiWan),
                Answer(text: "Quiet and philosophical", type: .morpheus),
                Answer(text: "Warm but mysterious", type: .dumbledore)
            ]
        ),

        Question(
            text: "How bold do you want your mentor’s lessons to be?",
            type: .ranged,
            answers: [
                Answer(text: "Safe", type: .fredRogers),
                Answer(text: "Moderately", type: .mrMiyagi),
                Answer(text: "Push you", type: .obiWan),
                Answer(text: "High-risk", type: .morpheus)
            ]
        ),

        Question(
            text: "Which teaching style do you prefer?",
            type: .multiple,
            answers: [
                Answer(text: "Hands-on practice", type: .mrMiyagi),
                Answer(text: "Stories and metaphor", type: .gandalf),
                Answer(text: "Humor and optimism", type: .tedLasso),
                Answer(text: "Academic and intellectual", type: .professorX)
            ]
        ),

        Question(
            text: "Which worldview best matches you?",
            type: .single,
            answers: [
                Answer(text: "Everything happens for a reason", type: .gandalf),
                Answer(text: "People choose their own path", type: .dumbledore),
                Answer(text: "Growth through discipline", type: .yoda),
                Answer(text: "Kindness is the strongest force", type: .fredRogers)
            ]
        ),

        Question(
            text: "What energy level do you want in your mentor?",
            type: .multiple,
            answers: [
                Answer(text: "Soft and slow-paced", type: .fredRogers),
                Answer(text: "Calm and focused", type: .obiWan),
                Answer(text: "High-energy encouragement", type: .tedLasso),
                Answer(text: "Wild enthusiasm", type: .hagrid)
            ]
        ),

        Question(
            text: "How should your mentor handle your mistakes?",
            type: .single,
            answers: [
                Answer(text: "Direct correction", type: .mcGonagall),
                Answer(text: "Gentle explanation", type: .mrMiyagi),
                Answer(text: "Emotional reassurance", type: .fredRogers),
                Answer(text: "Ask deep questions to guide you", type: .professorX)
            ]
        ),

        Question(
            text: "Do you prefer your mentor to be mysterious or open?",
            type: .ranged,
            answers: [
                Answer(text: "Transparent", type: .tedLasso),
                Answer(text: "Private", type: .dumbledore),
                Answer(text: "Cryptic", type: .yoda),
                Answer(text: "Prophecy", type: .gandalf)
            ]
        ),

        Question(
            text: "What main role should your mentor fill?",
            type: .multiple,
            answers: [
                Answer(text: "Protector", type: .hagrid),
                Answer(text: "Guide", type: .obiWan),
                Answer(text: "Teacher", type: .professorX),
                Answer(text: "Philosopher", type: .morpheus)
            ]
        ),

        Question(
            text: "Which value is most important to you?",
            type: .single,
            answers: [
                Answer(text: "Courage", type: .gandalf),
                Answer(text: "Wisdom", type: .yoda),
                Answer(text: "Kindness", type: .fredRogers),
                Answer(text: "Growth through challenge", type: .morpheus)
            ]
        )
    ]

    
    func selectAnswer(_ answers: [Answer]) {
        for answer in answers {
            selectedAnswers.append(answer)
        }
    }
    func deselectAnswer(_ answers: [Answer]) {
        for answer in answers {
            if let index = selectedAnswers.firstIndex(of: answer) {
                selectedAnswers.remove(at: index)
            }
        }
    }
}

