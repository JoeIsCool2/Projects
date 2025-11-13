import SwiftUI

extension Color {
    static func random() -> Color {
        let colors: [Color] = [
//            .red, .orange, .yellow,
//            .pink, .indigo, .green
            .electricBlue, .springGreen, .malachite, .emerald, .darkSlateGray
        ]
        return colors.randomElement() ?? .yellow
    }
}
