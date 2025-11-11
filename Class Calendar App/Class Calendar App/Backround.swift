import SwiftUI

struct Backround: View {
    var body: some View {
        ZStack {
//            Color(Color.black)
//                .ignoresSafeArea()
//                .scaledToFill()
            MovingCircleView(color: .red)
            MovingCircleView(color: .yellow)
            MovingCircleView(color: .orange)
            MovingCircleView(color: .yellow)
            MovingCircleView(color: .red)
            MovingCircleView(color: .orange)
            MovingCircleView(color: .red)
            MovingCircleView(color: .yellow)
            MovingCircleView(color: .orange)
            MovingCircleView(color: .yellow)
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
        Timer.scheduledTimer(withTimeInterval: 9.0, repeats: true) { _ in
            withAnimation(.easeInOut(duration: 10.0)) {
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
