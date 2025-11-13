import SwiftUI

struct Calendar: View {
    @State var calendarData = CalendarData()
    @State private var calendar: [Today] = []
    @State var isClicked = false
    @State var currentlyClickedOn: Today? = nil
    @State var indicators: [String] = []
    @State var indicator: String = ""
    
    var body: some View {
        ZStack {
            Backround()
            VStack(spacing: 16) {
                
                Text("Calendar")
                    .modifier(TitleText())
                
                Picker("Which Lesson", selection: $indicator) {
                    ForEach(indicators, id: \.self) { lessonID in
                        Text(lessonID).tag(lessonID)
                    }
                }
                .pickerStyle(.palette)
                .font(.custom("American Typewriter", size: 40))
                .tint(.emerald)
                .padding(2)
                .background(
                    Capsule()
                        .fill(.clear)
                        .glassEffect(
                            .regular.tint(.electricBlue).interactive(),
                            in: .rect(cornerRadius: 30)
                        )
                )
                .onChange(of: indicator) { newValue in
                    calendar = calendarData.findCurrentCalendar(indicator: newValue)
                }
                
                ScrollView {
                    ForEach(calendar.indices, id: \.self) { index in
                        let day = calendar[index]
                        let color = day.color
                        let colorChange = FindColor()
                        let textColor = colorChange.findComplementaryColor(color: color)
                        
                        HStack {
                            Text(day.lessonID)
                                .padding()
                                .font(.custom("American Typewriter", size: 25))
                                .foregroundStyle(.black)
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
                                    .font(.custom("American Typewriter", size: 20))
                                Text(day.assignmentsDue)
                                    .foregroundStyle(textColor)
                                    .font(.custom("American Typewriter", size: 20))
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
        // 👇 Load indicators and default calendar automatically
        .onAppear {
            indicators = calendarData.findData()
            if let first = indicators.first {
                indicator = first
                calendar = calendarData.findCurrentCalendar(indicator: first)
            }
        }
    }
}


extension CalendarData {
    func findCurrentCalendar(indicator: String) -> [Today] {
        let calendarDays = days
        return calendarDays.filter { $0.lessonID.contains(indicator) }
    }
    
    func findData() -> [String] {
        var allTypes: [String] = []
        for day in days {
            let prefix = String(day.lessonID.prefix(2))
            if !allTypes.contains(prefix) {
                allTypes.append(prefix)
            }
        }
        return allTypes
    }
}

#Preview {
    Calendar()
}
