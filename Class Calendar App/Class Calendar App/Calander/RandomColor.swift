import SwiftUI

extension Color {
    static func random() -> Color {
        let colors: [Color] = [
            .red, .orange, .yellow,
            .pink, .indigo, .green
        ]
        return colors.randomElement() ?? .yellow
    }
}
