import SwiftUI

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
