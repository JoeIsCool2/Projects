import SwiftUI

enum House {
    case Slytherin, Gryffindor, Hufflepuff, Ravenclaw
}

struct QuizView: View {
    @State var results: [House] = []
    @State var currentQuestion = 0
    
    var body: some View {
        ZStack {
            Image("BackgroundImage1")
                .resizable()
                .ignoresSafeArea()
                .scaledToFill()
            VStack {
                if currentQuestion < multipleChoiceQuestions.count {
                       MultipleChoiceQuestion(
                           question: multipleChoiceQuestions[currentQuestion],
                           results: $results
                       )
                   } else if currentQuestion < (multipleChoiceQuestions.count + pickerQuestions.count) {
                       let pickerIndex = currentQuestion - multipleChoiceQuestions.count
                       PickerQuestion(
                           question: pickerQuestions[pickerIndex],
                           results: $results
                       )
                   } else if currentQuestion < (multipleChoiceQuestions.count + pickerQuestions.count + pickerQuestions.count) {
                       let sliderIndex = currentQuestion - multipleChoiceQuestions.count - pickerQuestions.count
                       SliderQuestion(
                           question: sliderQuestions[sliderIndex],
                           results: $results
                       )
                       .padding(50)
                   } else {
                       Text("something broke")
                   }
                HStack {
                    if currentQuestion > 0 {
                        Button("Back", action: backAQuesiton)
                            .buttonStyle(ButtonCapsule())
                    }
                    if currentQuestion < multipleChoiceQuestions.count + pickerQuestions.count + pickerQuestions.count - 1 {
                        Button("Next", action: nextQuesiton)
                            .buttonStyle(ButtonCapsule())
                    } else {
                        NavigationLink("Finish Quiz →", destination: EndScreen(results: $results))
                            .buttonStyle(ButtonCapsule())
                    }
                }
            }
        }
    }
    func nextQuesiton() {
        currentQuestion += 1
    }
    func backAQuesiton() {
        currentQuestion -= 1
    }
}
