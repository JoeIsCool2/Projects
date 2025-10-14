import SwiftUI

struct SliderQuestion: View {
    var question: String
    var order: [options]
    var minLabel: String
    var maxLabel: String
    @State private var sliderValue: Double = 0
    @State private var isEditing: Bool = false
    @Binding var results: [options]
    @Binding var currentQuestion: Int
    
    var body: some View {
        VStack(spacing: 20) {
            // Question text
            Text(question)
                .font(.headline)
                .multilineTextAlignment(.center)
                .padding(.horizontal)
            
            // Slider with value indicator
            VStack(spacing: 10) {
                Slider(
                    value: $sliderValue,
                    in: 0...100,
                    onEditingChanged: { editing in
                        isEditing = editing
                    }
                )
                .tint(isEditing ? Theme.RavenclawDusk : Theme.SlytherinShadow)
                
                // Min/max labels aligned to each end
                HStack {
                    Text(minLabel)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Text(maxLabel)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                        .frame(maxWidth: .infinity, alignment: .trailing)
                }
            }
            
            // Slider value display
            Text("\(Int(sliderValue))")
                .foregroundColor(isEditing ? Theme.RavenclawDusk : Theme.SlytherinShadow)
                .font(.title3)
                .bold()
            
            // Next button
            Button(action: {
                currentQuestion += 1
                switch sliderValue {
                case 0..<25: results.append(order[0])
                case 25..<50: results.append(order[1])
                case 50..<75: results.append(order[2])
                case 75...100: results.append(order[3])
                default: print("It Broke")
                }
                sliderValue = 0
            }) {
                    Text("Next")
                        .font(.headline)
                        .fontWeight(.semibold)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 16)
                        .background(
                            LinearGradient(
                                colors: [Theme.RavenclawDusk, Theme.SlytherinShadow],
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            )
                        )
                        .foregroundColor(Theme.textPrimary)
                        .cornerRadius(12)
                        .shadow(color: Theme.SlytherinShadow.opacity(0.7), radius: 10, x: 0, y: 5)
                        .overlay(
                            RoundedRectangle(cornerRadius: 12)
                                .stroke(Theme.GoldenGryffindor.opacity(0.6), lineWidth: 1)
                        )
                }
            }
        .padding()
        .glassEffect(in: .rect(cornerRadius: 30))
        .padding()
    }
}
