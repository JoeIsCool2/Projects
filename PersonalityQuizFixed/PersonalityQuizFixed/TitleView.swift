import SwiftUI

struct TitleView: View {
    
    @State var quizManager = QuizManager()
    
    var body: some View {
        NavigationStack {
            ZStack {
                Image(.background)
                    .resizable()
                    .ignoresSafeArea()
                    .scaledToFill()
                VStack {
                    Spacer()
                    VStack {
                        Text("Which Mentor Are")
                            .font(.custom("", size: 40))
                            .foregroundStyle(.brownGrey)
                            .shadow(color: .brownish, radius: 5)
                        Text("You")
                            .font(.custom("Impact", size: 100))
                            .foregroundStyle(.lightGoldenBrown)
                            .shadow(color: .brownish, radius: 8)
                    }
                    .padding()
                    Spacer()
                    NavigationLink("Begin") {
                        QuestionFlowView(question: quizManager.questionList[0])
                    }
                    .bold()
                    .foregroundStyle(.lightGoldenBrown)
                    .font(.custom("", size: 28))
                    .padding()
                    .glassEffect(.regular.tint(.brownish).interactive(), in: .rect(cornerRadius: 16.0))
                    Spacer()
                }
            }
        }
        .environment(quizManager)
    }
}

#Preview {
    TitleView()
}
