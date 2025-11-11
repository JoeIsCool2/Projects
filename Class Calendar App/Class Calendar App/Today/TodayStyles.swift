import SwiftUI

struct MakeDayCapsule: View {
    let title: String
    let Info: String
    let color: Color
    let colorChange = FindColor()
    var textColor: Color {
        colorChange.findComplementaryColor(color: color)
    }
    
    var body: some View {
        VStack {
            if !title.isEmpty {
                Text(title)
                    .font(.custom("Marker Felt", size: 40))
                    .foregroundStyle(textColor)
                    .padding()
                    .background(
                        Capsule()
                            .fill(color)
                            .glassEffect(
                                .regular.tint(.clear).interactive(),
                                in: .rect(cornerRadius: 30)
                            )
                    )
            }
            Text(Info)
                .foregroundStyle(textColor)
                .font(.custom("Marker Felt", size: 20))
                .multilineTextAlignment(.center)
                .truncationMode(.tail)
                .transition(.opacity)
        }
        .padding()
        .background (
            Capsule()
                .fill(.clear)
                .glassEffect(
                    .regular.tint(color).interactive(),
                    in: .rect(cornerRadius: 30)
                )
        )
        .padding()
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

