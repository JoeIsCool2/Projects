import SwiftUI

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    @Binding var isLoggedIn: Bool
    
    var body: some View {
        ZStack {
            Backround()
            VStack(spacing: 20) {
                TextField("Email", text: $email)
                    .textFieldStyle(.roundedBorder)
                    .textInputAutocapitalization(.never)
                
                SecureField("Password", text: $password)
                    .textFieldStyle(.roundedBorder)
                
                Button("Log In") {
                    Task {
                        if await NetworkManager.shared.login(email: email, password: password) {
                            isLoggedIn = true
                        }
                    }
                }
                .padding()
                .background(.white)
                .cornerRadius(10)
            }
            .padding()
        }
    }
}
