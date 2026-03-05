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
        VStack(spacing: 24) {
            Spacer()
            
            Image(systemName: "book.fill")
                .font(.system(size: 50))
                .foregroundColor(.white)
            
            Text("DevCampus")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.white)
            
            VStack(spacing: 12) {
                TextField("Email", text: $email)
                    .padding(12)
                    .background(Color.white)
                    .cornerRadius(8)
                    .textInputAutocapitalization(.never)
                    .keyboardType(.emailAddress)
                
                SecureField("Password", text: $password)
                    .padding(12)
                    .background(Color.white)
                    .cornerRadius(8)
                
                if let error = appState.authError {
                    Text(error)
                        .foregroundColor(.white)
                        .font(.caption)
                }
                
                Button(action: {
                    appState.login(email: email, pass: password)
                }) {
                    if appState.isLoggingIn {
                        ProgressView()
                            .tint(.white)
                    } else {
                        Text("Sign In")
                            .frame(maxWidth: .infinity)
                            .padding(12)
                            .background(Color.white)
                            .foregroundColor(.appBlue)
                            .cornerRadius(8)
                    }
                }
                .disabled(appState.isLoggingIn)
            }
            .padding(20)
            
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.appBlue)
    }
}
