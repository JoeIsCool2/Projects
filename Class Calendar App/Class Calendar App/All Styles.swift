import SwiftUI

struct TitleText: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.custom("American Typewriter", size: 75))
            .bold()
            .foregroundStyle(LinearGradient(colors: [.emerald, .springGreen, .emerald], startPoint: .leading, endPoint: .trailing))
            .shadow(color: .darkSlateGray, radius: 10)
            .multilineTextAlignment(.center)
            .lineLimit(2)
            .minimumScaleFactor(0.5)
            .padding(.horizontal, 24)
            .padding(.vertical, 12)
    }
}

extension Color {
    static let magenta = Color(red: 1.0, green: 0.0, blue: 1.0)
}

struct FindColor {
    func findComplementaryColor(color: Color) -> Color {
        switch color {
        case .red: return .white
        case .green: return .white
        case .blue: return .white
        case .orange: return .black
        case .yellow: return .black
        case .purple: return .white
        case .pink: return .black
        case .mint: return .black
        case .indigo: return .white
        case .teal: return .black
        case .gray: return .white
        case .white: return .black
        case .black: return .white
        case .brown: return .white
        default: return .black
        }
    }
}
