import SwiftUI

struct DueToday: View {
    let readingDue: String
    let assignmentsDue: String
    
    var body: some View {
        ZStack {
            Backround()
            VStack {
                Text("Reading Due Today")
                    .font(.system(size: 48, weight: .heavy, design: .rounded))
                    .foregroundStyle(.primary)
                    .multilineTextAlignment(.center)
                    .lineLimit(2)
                    .minimumScaleFactor(0.5)
                    .padding(.horizontal, 24)
                    .padding(.vertical, 12)
                MakeDayCapsule(title: "", Info: readingDue, color: .pink)
                Text("Assignments Due Today")
                    .font(.system(size: 48, weight: .heavy, design: .rounded))
                    .foregroundStyle(.primary)
                    .multilineTextAlignment(.center)
                    .lineLimit(2)
                    .minimumScaleFactor(0.5)
                    .padding(.horizontal, 24)
                    .padding(.vertical, 12)
                MakeDayCapsule(title: "", Info: assignmentsDue, color: .pink)
            }
        }
    }
}

#Preview {
    DueToday(readingDue: "57", assignmentsDue: "67")
}
