//
//  ContentView.swift
//  Personality Quiz
//
//  Created by joseph wright on 10/13/25.
//

import SwiftUI

enum options: String, CaseIterable, Hashable {
    case gri, huf, sli, rav
}

struct ContentView: View {
    @State var results: [options] = []
    @State private var currentQuestion = 0
    @Binding var isStarted: Bool
    var multipleChoiceQuestions: [MultipleChoiceBuilder] {
        [
            MultipleChoiceBuilder(
                question: "Which situations excite you most?",
                answers: [
                    .gri: "Facing something unpredictable or daring",
                    .huf: "Helping people work together toward a goal",
                    .rav: "Solving a mystery or figuring out how something works",
                    .sli: "Finding clever ways to get ahead or stand out"
                ],
                results: $results, currentQuestion: $currentQuestion
            ),
            
            MultipleChoiceBuilder(
                question: "What qualities do you look for in friends?",
                answers: [
                    .gri: "Honesty and bravery",
                    .huf: "Kindness and loyalty",
                    .rav: "Curiosity and understanding",
                    .sli: "Confidence and ambition"
                ],
                results: $results, currentQuestion: $currentQuestion
            ),

            MultipleChoiceBuilder(
                question: "You have a day completely free. How do you spend it?",
                answers: [
                    .gri: "Doing something spontaneous or adventurous",
                    .huf: "Catching up with people I care about",
                    .rav: "Learning or creating something new",
                    .sli: "Working toward a personal goal"
                ],
                results: $results, currentQuestion: $currentQuestion
            ),

            MultipleChoiceBuilder(
                question: "When something goes wrong, what’s your first reaction?",
                answers: [
                    .gri: "Act fast and fix it head-on",
                    .huf: "Stay calm and help others feel okay",
                    .rav: "Think through what went wrong and why",
                    .sli: "Find a way to turn it to my advantage"
                ],
                results: $results, currentQuestion: $currentQuestion
            )
        ]
    }

    var pickerQuestions: [PickerBuilder] {
        [
            PickerBuilder(
                question: "Which of these feels most rewarding?",
                answers: [
                    .gri: "Achieving something difficult",
                    .huf: "Knowing I made a difference for someone",
                    .rav: "Understanding something deeply",
                    .sli: "Proving myself and succeeding"
                ],
                results: $results, currentQuestion: $currentQuestion
            ),
            
            PickerBuilder(
                question: "What type of environment brings out your best?",
                answers: [
                    .gri: "Exciting and fast-paced",
                    .huf: "Friendly and supportive",
                    .rav: "Focused and quiet",
                    .sli: "Ambitious and competitive"
                ],
                results: $results, currentQuestion: $currentQuestion
            ),

            PickerBuilder(
                question: "How do you usually make important decisions?",
                answers: [
                    .gri: "By trusting my instincts",
                    .huf: "By thinking about what’s best for everyone",
                    .rav: "By analyzing all the details",
                    .sli: "By choosing the option that benefits me long-term"
                ],
                results: $results, currentQuestion: $currentQuestion
            ),

            PickerBuilder(
                question: "Which of these do you value most?",
                answers: [
                    .gri: "Courage",
                    .huf: "Kindness",
                    .rav: "Wisdom",
                    .sli: "Ambition"
                ],
                results: $results, currentQuestion: $currentQuestion
            )
        ]
    }

    
    var sliderQuestions: [SliderQuestion] {
        [
            SliderQuestion(
                question: "How comfortable are you taking risks?",
                order: [.huf, .rav, .sli, .gri],
                minLabel: "Avoid risks",
                maxLabel: "Love taking risks",
                results: $results,
                currentQuestion: $currentQuestion
            ),
            
            SliderQuestion(
                question: "How curious are you about how things work?",
                order: [.sli, .huf, .gri, .rav],
                minLabel: "Rarely curious",
                maxLabel: "Constantly curious",
                results: $results,
                currentQuestion: $currentQuestion
            ),
            
            SliderQuestion(
                question: "How motivated are you by helping others?",
                order: [.sli, .rav, .gri, .huf],
                minLabel: "Not very",
                maxLabel: "Extremely",
                results: $results,
                currentQuestion: $currentQuestion
            ),
            
            SliderQuestion(
                question: "How competitive would you say you are?",
                order: [.huf, .rav, .gri, .sli],
                minLabel: "Not competitive",
                maxLabel: "Very competitive",
                results: $results,
                currentQuestion: $currentQuestion
            )
        ]
    }
    
    var body: some View {
        ZStack {
            AnimatedBackground()
            VStack {
                if currentQuestion < multipleChoiceQuestions.count {
                    multipleChoiceQuestions[currentQuestion]
                } else if currentQuestion < multipleChoiceQuestions.count + pickerQuestions.count {
                    pickerQuestions[currentQuestion - multipleChoiceQuestions.count]
                } else if currentQuestion < multipleChoiceQuestions.count + pickerQuestions.count + sliderQuestions.count {
                    sliderQuestions[currentQuestion - multipleChoiceQuestions.count - pickerQuestions.count]
                } else {
                    EndScreen(results: $results, currentQuestion: $currentQuestion, isStarted: $isStarted)
                }
            }
        }
    }
}
