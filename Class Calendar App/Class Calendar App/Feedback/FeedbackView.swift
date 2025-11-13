import SwiftUI

struct FeedbackView: View {
    @State var lessonForFeedback: String = ""   // selected lesson
    @State private var calendarData = CalendarData()
    @State private var feedback: String = ""
    @Binding var isSubmittingFeedback: Bool
    let randomColor = Color.random()
    let colorChange = FindColor()
    var textColor: Color {
        colorChange.findComplementaryColor(color: randomColor)
    }
    
    var body: some View {
        let allDays = calendarData.days.map { $0.lessonID }
        
        ZStack {
            Backround()
            VStack {
                HStack{
                    Text("Which Lesson")
                        .font(.custom("American Typewriter", size: 30))
                        .bold()
                        .multilineTextAlignment(.center)
                        .lineLimit(2)
                        .minimumScaleFactor(0.5)
                        .padding(.horizontal, 24)
                        .padding(.vertical, 12)
                    Picker("Which Lesson", selection: $lessonForFeedback) {
                        ForEach(allDays, id: \.self) { lessonID in
                            Text(lessonID).tag(lessonID)
                        }
                    }
                    .pickerStyle(.menu)
                    .font(.custom("American Typewriter", size: 40))
                    .tint(textColor)
                    .padding()
                    .background(
                        Capsule()
                            .fill(.clear)
                            .glassEffect(
                                .regular.tint(randomColor).interactive(),
                                in: .rect(cornerRadius: 30)
                            )
                    )
                }
                VStack {
                    Text("What feedback do you have for this lesson")
                        .foregroundStyle(textColor)
                    Rectangle()
                        .frame(height: 1)
                        .foregroundStyle(textColor)
                    TextField("Give Feedback", text: $feedback)
                        .foregroundStyle(textColor)
                }
                    .font(.custom("American Typewriter", size: 20))
                    .padding()
                    .background(
                        Capsule()
                            .fill(.clear)
                            .glassEffect(
                                .regular.tint(randomColor).interactive(),
                                in: .rect(cornerRadius: 30)
                            )
                    )
            }
            .padding()
            }
        Button("Submit") {
            isSubmittingFeedback.toggle()
        }
        .font(.custom("American Typewriter", size: 20))
        .padding()
        .foregroundStyle(textColor)
        .background(
            Capsule()
                .fill(.clear)
                .glassEffect(
                    .regular.tint(randomColor).interactive(),
                    in: .rect(cornerRadius: 30)
                )
        )
    }
}


