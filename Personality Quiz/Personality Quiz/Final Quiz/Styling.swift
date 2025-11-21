import SwiftUI

struct BigWords: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 56, weight: .bold, design: .serif))
            .foregroundColor(.white)
            .shadow(color: Color.black, radius: 4, x: 0, y: 2)
    }
}

struct BigishWords: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 36, weight: .bold, design: .serif))
            .foregroundColor(.white)
            .shadow(color: Color.black, radius: 4, x: 0, y: 2)
            .padding()
    }
}
struct InfoCapsule: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 12, weight: .bold, design: .serif))
            .foregroundColor(.gray)
            .padding()
            .glassEffect(in: .rect(cornerRadius: 16.0))
            .tint(.white)
            .padding()
    }
}


struct ButtonCapsule: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.system(size: 23, weight: .bold, design: .serif))
            .foregroundColor(.gray)
            .padding(.horizontal, 24)
            .padding(.vertical, 12)
            .glassEffect(in: .rect(cornerRadius: 16.0))
    }
}

struct AnswerButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.system(size: 23, weight: .bold, design: .serif))
            .foregroundColor(.white)
            .padding(.horizontal, 24)
            .padding(.vertical, 12)
            .glassEffect(in: .rect(cornerRadius: 16.0))
    }
}

struct BigButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.system(size: 56, weight: .bold, design: .serif))
            .foregroundColor(.white)
            .shadow(color: Color.black, radius: 4, x: 0, y: 2)
            .padding(.horizontal, 24)
            .padding(.vertical, 12)
            .glassEffect(in: .rect(cornerRadius: 16.0))
    }
}
