//
//  LoginView.swift
//  Calendar
//

import SwiftUI

// email and password login form
struct LoginView: View {
    @Environment(AppState.self) var appState
    @State private var email = ""
    @State private var password = ""
    
    var body: some View {
        ZStack {
            LinearGradient(colors: [.brandPrimary, .brandSecondary], startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()
            
            VStack(spacing: 30) {
                Image(systemName: "graduationcap.fill")
                    .font(.system(size: 70))
                    .foregroundColor(.white)
                    .shadow(radius: 10)
                
                Text("DevCampus")
                    .font(.system(size: 36, weight: .bold, design: .rounded))
                    .foregroundColor(.white)
                
                VStack(spacing: 20) {
                    TextField("Email", text: $email)
                        .padding()
                        .background(.white)
                        .cornerRadius(12)
                        .textInputAutocapitalization(.never)
                        .keyboardType(.emailAddress)
                    
                    SecureField("Password", text: $password)
                        .padding()
                        .background(.white)
                        .cornerRadius(12)
                    
                    if let error = appState.authError {
                        Text(error)
                            .foregroundColor(.white)
                            .fontWeight(.bold)
                            .font(.caption)
                    }
                    
                    Button(action: {
                        appState.login(email: email, pass: password)
                    }) {
                        if appState.isLoggingIn {
                            ProgressView().tint(.black)
                        } else {
                            Text("Sign In")
                                .bold()
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(.white)
                                .cornerRadius(12)
                                .foregroundColor(.brandPrimary)
                        }
                    }
                    .disabled(appState.isLoggingIn)
                }
                .padding(30)
                .background(.ultraThinMaterial)
                .cornerRadius(24)
                .padding()
            }
        }
    }
}
