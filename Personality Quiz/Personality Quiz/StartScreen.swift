import SwiftUI

struct StartScreen: View {
    @Binding var isStarted: Bool
    
    var body: some View {
        ZStack {
            // Background
            AnimatedBackground()
                .ignoresSafeArea()
                .overlay(
                    LinearGradient(
                        colors: [Theme.HogwartsMidnight.opacity(0.7), Theme.RavenclawDusk.opacity(0.5)],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                )

            VStack(spacing: 35) {
                Spacer()
                
                // Title
                Text("Welcome to the Hogwarts House Quiz")
                    .font(.system(size: 32, weight: .bold, design: .serif))
                    .foregroundColor(Theme.textPrimary)
                    .multilineTextAlignment(.center)
                    .shadow(color: Theme.RavenclawDusk.opacity(0.5), radius: 8, x: 0, y: 4)
                    .padding(.horizontal, 30)

                // Description Card
                VStack(spacing: 18) {
                    Text("Discover which Hogwarts House best matches your spirit.")
                        .font(.title3)
                        .fontWeight(.semibold)
                        .foregroundColor(Theme.textSecondary)
                        .multilineTextAlignment(.center)

                    Text("You’ll answer a mix of magical questions — some let you choose multiple answers, others only one. Be honest and trust your instincts — your true house will find you.")
                        .font(.body)
                        .foregroundColor(Theme.textSecondary)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 10)
                }
                .padding(25)
                .background(.ultraThinMaterial)
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(Theme.cardStroke, lineWidth: 1)
                )
                .cornerRadius(20)
                .shadow(color: Theme.cardShadow, radius: 10, x: 0, y: 6)
                .padding(.horizontal, 25)

                Spacer()
                
                // Start Button
                Button(action: {
                    withAnimation(.easeInOut(duration: 0.6)) {
                        isStarted = true
                    }
                }) {
                    Text("Start the Quiz")
                        .font(.headline)
                        .padding(.horizontal, 50)
                        .padding(.vertical, 16)
                        .background(
                            LinearGradient(
                                colors: [Theme.RavenclawDusk, Theme.SlytherinShadow],
                                startPoint: .leading,
                                endPoint: .trailing
                            )
                        )
                        .foregroundColor(.white)
                        .clipShape(Capsule())
                        .shadow(color: Theme.SlytherinShadow.opacity(0.7), radius: 12, x: 0, y: 6)
                }
                .padding(.bottom, 60)
            }
            .padding()
        }
    }
}
