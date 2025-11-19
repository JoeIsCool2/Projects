import SwiftUI

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
