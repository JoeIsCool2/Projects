import SwiftUI

struct Calendar: View {
    @State private var calendar = CalendarData()
    @State var isClicked = false
    @State var currentlyClickedOn: Today? = nil
    
    var body: some View {
        ZStack {
            Backround()
                VStack(spacing: 16) {
                    Text("Calendar")
                        .font(.system(size: 48, weight: .heavy, design: .rounded))
                        .foregroundStyle(.primary)
                        .multilineTextAlignment(.center)
                        .lineLimit(2)
                        .minimumScaleFactor(0.5)
                        .padding(.horizontal, 24)
                        .padding(.vertical, 12)
                    ScrollView {
                    ForEach(calendar.days.indices, id: \.self) { index in
                        let day = calendar.days[index]
                        let color = day.color
                        let colorChange = FindColor()
                        var textColor: Color {
                            colorChange.findComplementaryColor(color: color)
                        }
                            HStack {
                                Text(day.lessonID)
                                    .padding()
                                    .font(.custom("Marker Felt", size: 25))
                                    .background(
                                        Capsule()
                                            .fill(.clear)
                                            .glassEffect(
                                                .regular.tint(.white).interactive(),
                                                in: .rect(cornerRadius: 15)
                                            )
                                    )
                                Spacer()
                                VStack {
                                    Text(day.lessonName)
                                        .bold()
                                        .foregroundStyle(textColor)
                                        .font(.custom("Marker Felt", size: 20))
                                    Text(day.assignmentsDue)
                                        .foregroundStyle(textColor)
                                        .font(.custom("Marker Felt", size: 20))
                                }
                                Spacer()
                        }
                        .padding(10)
                        .background(
                            Capsule()
                                .fill(.clear)
                                .glassEffect(
                                    .regular.tint(color).interactive(),
                                    in: .rect(cornerRadius: 30)
                                )
                                .onTapGesture {
                                    isClicked.toggle()
                                    currentlyClickedOn = day
                                }
                        )
                        .onTapGesture {
                            isClicked.toggle()
                            currentlyClickedOn = day
                        }
                    }
                    .background(Color.clear)
                }
                    .sheet(isPresented: $isClicked) {
                        if let day = currentlyClickedOn {
                            TodayView(today: day)
                        }
                    }
            }
                .padding()
        }
    }
}


#Preview {
    Calendar()
}
