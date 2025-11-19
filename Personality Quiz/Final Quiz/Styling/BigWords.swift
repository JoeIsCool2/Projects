import SwiftUI

struct BigWords: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 56, weight: .bold, design: .serif))
            .foregroundColor(.white)
            .shadow(color: Color.black, radius: 4, x: 0, y: 2)
    }
}
