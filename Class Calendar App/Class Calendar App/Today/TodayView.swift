import SwiftUI

struct TodayView: View {
    let today: Today
    
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
                                .font(.system(size: 48, weight: .heavy, design: .rounded))
                                .foregroundStyle(.primary)
                                .multilineTextAlignment(.center)
                                .lineLimit(2)
                                .minimumScaleFactor(0.5)
                                .padding(.horizontal, 24)
                                .padding(.vertical, 12)
                            
                        }
                        MakeDayCapsule(title: "Goal For Today", Info: today.mainObjective, color: .yellow)
                        
                        MakeDayCapsule(title: "Code Challenge", Info: today.dailyCodeChallengeName, color: .green)
                        MakeDayCapsule(title: "Word of the day", Info: today.dailyCodeChallengeName, color: .pink)
                        ZStack {
                            Rectangle()
                                .foregroundStyle(.clear)
                            VStack {
                                Text("Due Today")
                                    .font(.custom("Marker Felt", size: 40))
                                    .foregroundStyle(.black)
                                    .padding()
                                    .background(
                                        Capsule()
                                            .fill(.yellow)
                                            .glassEffect(
                                                .regular.tint(.clear).interactive(),
                                                in: .rect(cornerRadius: 30)
                                            )
                                    )
                                HStack {
                                    MakeDayCapsule(title: "", Info: today.readingDue, color: .orange)
                                    MakeDayCapsule(title: "", Info: today.assignmentsDue, color: .red)
                                }
                            }
                            .padding()
                            .background (
                                Capsule()
                                    .fill(.clear)
                                    .glassEffect(
                                        .regular.tint(.yellow).interactive(),
                                        in: .rect(cornerRadius: 30)
                                    )
                            )
                        }
                        .padding()
                        MakeDayCapsule(title: "New Assignments", Info: today.newAssignments, color: .teal)
                    }
                }
//                .glassEffect(in: .rect(cornerRadius: 30))
            }
        }
    }
}

#Preview {
    let data = TodayData()
    TodayView(today: data.today!)
}
