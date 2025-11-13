import SwiftUI

struct TodayView: View {
    let today: Today
    @State var isAssignmentShowing = false
    @State var isSubmittingFeedback = false
    let randomColor = Color.emerald
    let colorChange = FindColor()
    var textColor: Color {
        colorChange.findComplementaryColor(color: randomColor)
    }
    
    var body: some View {
        ZStack {
            Backround()
            ScrollView {
                ZStack {
                    VStack {
                        HStack {
                            Spacer()
                            Text(today.lessonID)
                                .ignoresSafeArea()
                            
                        }
                        Spacer()
                    }
                    .padding()
                    VStack {
                        ZStack {
                            Text(today.lessonName)
                                .modifier(TitleText())
                            
                        }
                        MakeDayCapsule(title: "Goal For Today", Info: today.mainObjective, color: .emerald)
                            .modifier(MakeSubView(title: "Goals For TOday", info: [today.mainObjective], color: today.color, isSubmitted: today.completed))
                        
                        MakeDayCapsule(title: "New Assignments", Info: today.newAssignments, color: .electricBlue)
                            .modifier(MakeSubView(title: "Assignment Outline", info: [today.newAssignments], color: today.color, isSubmitted: today.completed))
                        
                        MakeDayCapsule(title: "Code Challenge", Info: today.dailyCodeChallengeName, color: .springGreen)
                            .modifier(MakeSubView(title: "Code Challenge", info: [today.dailyCodeChallengeName], color: today.color, isSubmitted: today.completed))
                        
                        MakeDayCapsule(title: "Word of the day", Info: today.dailyCodeChallengeName, color: .malachite)
                            .modifier(MakeSubView(title: "Word of the day", info: [today.wordOfTheDay], color: today.color, isSubmitted: today.completed))
                        
                        ZStack {
                            Rectangle()
                                .foregroundStyle(.clear)
                            VStack {
                                Text("Due Today")
                                    .font(.custom("American Typewriter", size: 40))
                                    .foregroundStyle(.black)
                                    .padding()
                                    .background(
                                        Capsule()
                                            .fill(.clear)
                                            .glassEffect(
                                                .regular.tint(.electricBlue).interactive(),
                                                in: .rect(cornerRadius: 30)
                                            )
                                    )
                                    .modifier(MakeSubView(title: "Due Today", info: [today.assignmentsDue, today.readingDue], color: today.color, isSubmitted: today.completed))
                                HStack {
                                    MakeDayCapsule(title: "", Info: today.readingDue, color: .springGreen)
                                    MakeDayCapsule(title: "", Info: today.assignmentsDue, color: .emerald)
                                }
                            }
                            .padding()
                            .background (
                                Capsule()
                                    .fill(.clear)
                                    .glassEffect(
                                        .regular.tint(.darkSlateGray).interactive(),
                                        in: .rect(cornerRadius: 30)
                                    )
                            )
                        }
                        
                        .padding()
                        Button("Give Feedback") {
                            isSubmittingFeedback.toggle()
                        }
                        .font(.custom("American Typewriter", size: 40))
                        .foregroundStyle(textColor)
                        .padding()
                        .background(
                            Capsule()
                                .fill(.clear)
                                .glassEffect(
                                    .regular.tint(randomColor).interactive(),
                                    in: .rect(cornerRadius: 30)
                                )
                        )
                        .sheet(isPresented: $isSubmittingFeedback) {
                            FeedbackView(lessonForFeedback: today.lessonID, isSubmittingFeedback: $isSubmittingFeedback)
                        }
                    }
                }
//                .glassEffect(in: .rect(cornerRadius: 30))
            }
        }
    }
}

struct MakeSubView: ViewModifier {
    @State var isShowing = false
    let title: String
    let info: [String]
    let color: Color
    let isSubmitted: Bool
    
    func body(content: Content) -> some View {
        content
            .onTapGesture{
                isShowing.toggle()
            }
            .sheet(isPresented: $isShowing) {
                SubView(title: title, info: info, color: color, isSubmitted: isSubmitted)
            }
    }
}

#Preview {
    let data = TodayData()
    TodayView(today: data.today!)
}
