import SwiftUI

struct BlackFrame: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding()
            .glassEffect(.regular.tint(.white).interactive(), in: .rect(cornerRadius: 16.0))
            .padding(5)
            .glassEffect(.regular.tint(.black).interactive(), in: .rect(cornerRadius: 16.0))
            
    }
}

struct BlackFrameButton: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(5)
            .glassEffect(.regular.tint(.white).interactive(), in: .rect(cornerRadius: 16.0))
            .padding(5)
            .glassEffect(.regular.tint(.black).interactive(), in: .rect(cornerRadius: 16.0))
            .shadow(radius: 8)
    }
}
