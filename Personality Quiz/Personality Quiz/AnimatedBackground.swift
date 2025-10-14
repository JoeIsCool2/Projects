import SwiftUI

struct AnimatedBackground: View {
    var body: some View {
        TimelineView(.animation) { timeline in
            let t = timeline.date.timeIntervalSinceReferenceDate
            Canvas { context, size in
                let rect = CGRect(origin: .zero, size: size)
                let base = Gradient(colors: [Theme.HogwartsMidnight, Theme.SlytherinShadow, Theme.RavenclawDusk])
                context.fill(Path(rect), with: .linearGradient(base,
                                                               startPoint: CGPoint(x: 0, y: 0),
                                                               endPoint: CGPoint(x: size.width, y: size.height)))

                func blob(_ center: CGPoint, _ radius: CGFloat, _ color: Color) {
                    let gradient = Gradient(colors: [color.opacity(0.35), color.opacity(0.0)])
                    context.fill(
                        Circle()
                            .path(in: CGRect(x: center.x - radius, y: center.y - radius, width: radius * 2, height: radius * 2)),
                        with: .radialGradient(gradient,
                                              center: center,
                                              startRadius: 0,
                                              endRadius: radius)
                    )
                }

                let x1 = size.width * (0.3 + 0.1 * sin(t / 4))
                let y1 = size.height * (0.25 + 0.1 * cos(t / 5))
                let x2 = size.width * (0.75 + 0.12 * cos(t / 3.2))
                let y2 = size.height * (0.65 + 0.1 * sin(t / 4.6))
                let x3 = size.width * (0.5 + 0.08 * sin(t / 6.5))
                let y3 = size.height * (0.45 + 0.08 * cos(t / 7))

                blob(CGPoint(x: x1, y: y1), min(size.width, size.height) * 0.35, Theme.CandlelightGlow)
                blob(CGPoint(x: x2, y: y2), min(size.width, size.height) * 0.30, Theme.GoldenGryffindor)
                blob(CGPoint(x: x3, y: y3), min(size.width, size.height) * 0.25, Color.white)
            }
        }
        .ignoresSafeArea()
    }
}
