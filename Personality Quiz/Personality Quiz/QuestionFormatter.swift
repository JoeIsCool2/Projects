import SwiftUI

struct MultipleChoiceBuilder: View {
    let question: String
    let answers: [options: String] // [answer: displayText]
    @Binding var results: [options]
    @Binding var currentQuestion: Int
    @State private var selected: options? = nil
    @State private var allSelected: [options?] = [nil]
    
    var body: some View {
        VStack {
            Text(question)
                .font(.custom("Academy Engraved LET", size: 40))
                .bold()
                .padding(.bottom)
            
            VStack(spacing: 10) {
                let keys = Array(answers.keys)
                ForEach(keys, id: \.self) { answer in
                    AnswerButton(
                        title: answers[answer] ?? String(describing: answer),
                        isSelected: Binding(
                            get: { allSelected.contains(answer) },
                            set: { newValue in
                                if newValue {
                                    selected = answer
                                    allSelected.append(selected)
                                    results.append(answer)
                                } else {
                                    if allSelected.contains(answer) {
                                        selected = answer
                                        var index = results.firstIndex(of: selected!)
                                        results.remove(at: index!)
                                        index = allSelected.firstIndex(of: selected!)
                                        allSelected.remove(at: index!)
                                        selected = nil
                                    }
                                }
                            }
                        )
                    )
                }
            }
            Button(action: {
                    currentQuestion += 1
                    selected = nil
                    allSelected = [nil]
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

struct PickerBuilder: View {
    let question: String
    let answers: [options: String] // [answer: displayText]
    @Binding var results: [options]
    @Binding var currentQuestion: Int
    @State private var selected: options? = nil
    @State private var previousAnswer: options? = nil
    
    var body: some View {
        VStack {
            Text(question)
                .font(.custom("Academy Engraved LET", size: 40))
                .bold()
                .padding(.bottom)
            
            VStack(spacing: 10) {
                let keys = Array(answers.keys)
                ForEach(keys, id: \.self) { answer in
                    AnswerButton(
                        title: answers[answer] ?? String(describing: answer),
                        isSelected: Binding(
                            get: { selected == answer },
                            set: { newValue in
                                if newValue {
                                    selected = answer
                                    results.append(answer)
                                    if previousAnswer != nil {
                                        let index = results.firstIndex(of: previousAnswer!)
                                        results.remove(at: index!)
                                    }
                                    previousAnswer = answer
                                } else {
                                    if selected == answer {
                                        let index = results.firstIndex(of: selected!)
                                        results.remove(at: index!)
                                        selected = nil
                                    }
                                }
                            }
                        )
                    )
                }
            }
            Button(action: {
                    currentQuestion += 1
                    selected = nil
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

struct AnswerButton: View {
    let title: String
    @Binding var isSelected: Bool
    var body: some View {
        HStack {
            Button(action: {
                isSelected.toggle()
            }) {
                Text(title)
                    .frame(maxWidth: .infinity)
            }
            Spacer()
            if isSelected {
                Image(systemName: "checkmark")
            }
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(isSelected ? Theme.RavenclawDusk.opacity(0.7) : Color.gray.opacity(0.2))
        .foregroundColor(.primary)
        .cornerRadius(10)
    }
}
