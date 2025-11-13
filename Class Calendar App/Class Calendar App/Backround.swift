import SwiftUI

struct Backround: View {
    var body: some View {
        ZStack {
            
            Color.darkSlateGray
                .ignoresSafeArea()
            
            MovingCircleView(color: .electricBlue)
            MovingCircleView(color: .springGreen)
            MovingCircleView(color: .malachite)
            MovingCircleView(color: .emerald)
            MovingCircleView(color: .electricBlue)
            MovingCircleView(color: .springGreen)
            MovingCircleView(color: .malachite)
            MovingCircleView(color: .emerald)
        }
    }
}

struct MovingCircleView: View {
    @State private var position: CGPoint = CGPoint(x: Int.random(in: 50...350), y: Int.random(in: 100...700))
    let color: Color

    var body: some View {
        Circle()
            .fill(
                RadialGradient(
                    gradient: Gradient(colors: [color, .clear]),
                    center: .center,
                    startRadius: 0,
                    endRadius: 100
                )
            )
            .frame(width: 200, height: 200)
            .position(position)
            .onAppear {
                moveRandomly()
            }
    }

    func moveRandomly() {
        Timer.scheduledTimer(withTimeInterval: 19.0, repeats: true) { _ in
            withAnimation(.easeInOut(duration: 20.0)) {
                position = CGPoint(
                    x: CGFloat.random(in: 50...350),
                    y: CGFloat.random(in: 100...700)
                )
            }
        }
    }
}


#Preview {
    Backround()
}
