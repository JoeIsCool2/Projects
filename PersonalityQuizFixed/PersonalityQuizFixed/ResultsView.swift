import SwiftUI

struct ResultsView: View {
    @State private var mentorName: String = ""
    @State private var mentorDescription: String = ""
    @Environment(QuizManager.self) var quizManager
    
    var body: some View {
        ZStack {
            Image(.background)
                .resizable()
                .ignoresSafeArea()
            
            VStack {
                Text("Your Mentor Match:")
                    .font(.custom("", size: 40))
                    .foregroundStyle(.brownGrey)
                    .shadow(color: .brownish, radius: 5)
                
                Text(mentorName)
                    .font(.custom("Impact", size: 80))
                    .foregroundStyle(.lightGoldenBrown)
                    .shadow(color: .brownish, radius: 8)
                    .multilineTextAlignment(.center)
                ScrollView {
                    Text(mentorDescription)
                        .bold()
                        .foregroundStyle(.lightGoldenBrown)
                        .padding()
                        .glassEffect(.regular.tint(.brownish).interactive(), in: .rect(cornerRadius: 16.0))
                }
            }
        }
        .onAppear {
            calculateWinner()
        }
    }
    
    private func calculateWinner() {
        let counts = Dictionary(grouping: quizManager.selectedAnswers, by: { $0.type })
            .mapValues { $0.count }
        
        if let (winner, _) = counts.max(by: { $0.value < $1.value }) {
            switch winner {
            case .gandalf:
                mentorName = "Gandalf"
                mentorDescription =
                "You match Gandalf because your answers reveal a personality that is calm, grounded, and deeply thoughtful. You don’t chase attention or rush decisions—you look for the meaning underneath things. You likely prefer wisdom over noise, long-term solutions over shortcuts, and helping people through steady guidance rather than control. You’re the type who becomes the anchor in your friend group, offering clarity when others feel lost. Like Gandalf, you carry quiet strength, patience, and a talent for seeing the bigger picture."

            case .dumbledore:
                mentorName = "Albus Dumbledore"
                mentorDescription =
                "You match Dumbledore because your answers show that you lead with warmth, trust, and emotional intelligence. You believe people grow when they feel believed in, and you naturally encourage others through compassion rather than pressure. You’re playful at times, serious when needed, and you don’t mind being a little mysterious if it helps people learn the right lesson. Your personality blends empathy with courage—you’re kind, but never weak. Like Dumbledore, you lift others by helping them discover their own strength."

            case .yoda:
                mentorName = "Yoda"
                mentorDescription =
                "You match Yoda because your answers reflect discipline, patience, and a strong inner world. You don’t get thrown off easily—you think before acting and prefer clarity over chaos. You value mastery, consistency, and emotional balance, and you tend to give advice that is short, direct, and surprisingly deep. You’re the type who helps people calm down, focus, and see what really matters. Like Yoda, your strength comes from self-control and a wise, centered perspective."

            case .mrMiyagi:
                mentorName = "Mr. Miyagi"
                mentorDescription =
                "You match Mr. Miyagi because your answers reveal a personality based in patience, humility, and craftsmanship. You believe that small habits shape big results, and you value effort, consistency, and respect. You’re steady, dependable, and you tend to show people the lesson through action, not speeches. You’re gentle but firm, supportive but honest. Like Mr. Miyagi, you help people grow by teaching them how to build themselves one skill at a time."

            case .mcGonagall:
                mentorName = "Minerva McGonagall"
                mentorDescription =
                "You match Professor McGonagall because your answers show that you value structure, fairness, and high standards. You’re responsible, disciplined, and quietly protective of the people you care about. You believe in earning success, giving clear feedback, and holding yourself to the same expectations you set for others. You’re strong without being harsh, and caring without being overprotective. Like McGonagall, people respect you because you always try to do what’s right."

            case .professorX:
                mentorName = "Professor X"
                mentorDescription =
                "You match Professor X because your answers reveal empathy, open-mindedness, and a talent for creating harmony. You’re a natural listener who understands people’s strengths and wants everyone to feel valued. You look for solutions that include everyone, and you guide others by empowering—not controlling—them. You’re patient, principled, and able to bring out the best in a group. Like Professor X, your strength is creating unity and purpose wherever you go."

            case .obiWan:
                mentorName = "Obi-Wan Kenobi"
                mentorDescription =
                "You match Obi-Wan because your answers show calm judgment, emotional balance, and steady courage. You don’t panic in hard moments—you think, adapt, and move with purpose. You value responsibility, experience, and teaching through example. You’re patient, rational, and good at keeping your head when others can’t. Like Obi-Wan, you’re the person people trust when things get messy because you stay grounded and true to your principles."

            case .tedLasso:
                mentorName = "Ted Lasso"
                mentorDescription =
                "You match Ted Lasso because your answers show optimism, encouragement, and a talent for lifting people’s spirits. You believe kindness creates strength, and you use humor, curiosity, and positive energy to help people grow. You see potential before others see it in themselves, and you’re great at building community. You hold others accountable with care, not pressure. Like Ted Lasso, your presence makes people feel included, supported, and ready to try again."

            case .hagrid:
                mentorName = "Rubeus Hagrid"
                mentorDescription =
                "You match Hagrid because your answers reveal warmth, loyalty, and big-hearted courage. You protect the people you care about and make others feel safe simply by being yourself. You’re honest, enthusiastic, and unafraid to show your emotions. You believe in giving people chances and standing up for the misunderstood. Like Hagrid, your kindness is a force of strength, and people feel comforted just being around you."

            case .morpheus:
                mentorName = "Morpheus"
                mentorDescription =
                "You match Morpheus because your answers show vision, confidence, and a belief in unlocking potential. You challenge assumptions, ask powerful questions, and push people to think bigger. You’re steady under pressure and drawn to truth—even when it’s uncomfortable. You inspire others by showing them what they can become, not just who they are right now. Like Morpheus, you’re a catalyst for transformation."

            case .fredRogers:
                mentorName = "Fred Rogers"
                mentorDescription =
                "You match Fred Rogers because your answers highlight empathy, emotional clarity, and quiet strength. You value gentleness, respect, and human connection, especially when life feels heavy. You’re patient, thoughtful, and deeply tuned into the feelings of others. You teach through presence, listening, and kindness—not force. Like Mr. Rogers, you make people feel seen, safe, and appreciated exactly as they are."
            }
        } else {
            mentorName = "No mentor selected"
            mentorDescription = "Complete the quiz to discover which mentor best matches your style."
        }
    }
}

#Preview {
    ResultsView()
        .environment(QuizManager())
}
