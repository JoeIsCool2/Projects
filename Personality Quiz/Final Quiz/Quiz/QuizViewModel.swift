import SwiftUI
import Observation

@Observable
class QuizViewModel {
    var results: [House] = []
    var currentQuestion: Int = 0
    
    // Use the arrays you defined in All Questions.swift
    var multipleChoiceQuestionsData: [MultipleChoice] = multipleChoiceQuestions
    var pickerQuestionsData: [PickerQuestionMaker] = pickerQuestions
    var sliderQuestionsData: [SliderQuestionMaker] = sliderQuestions
    
    var totalQuestions: Int {
        multipleChoiceQuestionsData.count + pickerQuestionsData.count + sliderQuestionsData.count
    }
    
    func nextQuestion() {
        if currentQuestion < totalQuestions - 1 {
            currentQuestion += 1
        }
    }
    
    func backQuestion() {
        if currentQuestion > 0 {
            currentQuestion -= 1
        }
    }
}
