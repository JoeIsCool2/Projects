//
//  ContentView.swift
//  Final Quiz
//
//  Created by joseph wright on 10/21/25.
//

import SwiftUI

struct StartScreen: View {
    var body: some View {
        NavigationStack {
            ZStack {
                Image("BackgroundImage1")
                    .resizable()
                    .ignoresSafeArea()
                    .scaledToFill()
                VStack {
                    Text("Welcome")
                        .modifier(BigWords())
                    Text("Harry Potter was a boy wizard with a lightning bolt scar and the fashion sense of a confused owl. He lived in a cupboard under the stairs until a giant named Hagrid broke down the door, handed him a cake, and casually informed him he was famous. At wizard school, Harry made two best friends: Hermione, who read every book ever written (twice), and Ron, who mostly ate snacks and panicked. Together they fought a noseless villain named Voldemort, who had the vibe of a haunted salad fork and kept trying to kill Harry with increasingly dramatic hats. There were flying broomsticks, talking hats, angry trees, and one very judgmental cat. In the end, love conquered evil, friendship saved the day, and nobody ever explained why wizards still use quills in the age of ballpoint pens.")
                        .modifier(InfoCapsule())
                        .padding(.horizontal,60)
                    NavigationLink("Start Quiz →") { QuizView()
                    }
                    .buttonStyle(ButtonCapsule())
                }
                .padding()
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    StartScreen()
}
