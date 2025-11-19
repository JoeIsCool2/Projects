import SwiftUI

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
