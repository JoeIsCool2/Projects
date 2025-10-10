import SwiftUI

struct ProfileCard: View {
    let name: String
    let photo: String
    let shortDescription: String
    let longDescription: String
    let favoritFood: String
    
    @State private var hasBeenViewed: Bool = false
    @State private var showProfile: Bool = false   // <-- modal trigger
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .fill(.ultraThinMaterial)
                .frame(height: 160)
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(Color.white.opacity(0.2), lineWidth: 1)
                )
                .shadow(radius: 10)
            
            HStack(spacing: 16) {
                // Profile Image
                Image(photo)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 80, height: 80)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.white.opacity(0.3), lineWidth: 2))
                    .shadow(radius: 4)
                
                // Text Stack
                VStack(alignment: .leading, spacing: 6) {
                    Text(name)
                        .font(.title2.bold())
                        .foregroundStyle(.primary)
                    
                    Text(shortDescription)
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                        .lineLimit(3)
                        .multilineTextAlignment(.leading)
                }
                Spacer()
                
                HStack {
                    if hasBeenViewed {
                        Image(systemName: "checkmark.icloud")
                            .font(.title2)
                            .foregroundStyle(.green)
                            .padding(5)
                            .glassEffect()
                            .tint(.blue)
                            .padding(.vertical, 5)
                    }
                    
                    Button {
                        if !hasBeenViewed {
                            hasBeenViewed.toggle()
                        }
                        showProfile = true   // <-- open modal
                    } label: {
                        Image(systemName: "info.circle")
                            .font(.title2)
                            .foregroundStyle(.blue)
                    }
                }
            }
            .padding(.horizontal, 20)
        }
        .padding(.horizontal)
        // Attach the modal here
        .sheet(isPresented: $showProfile) {
            Profile(
                name: name,
                photo: photo,
                shortDescription: shortDescription,
                longDescription: longDescription,
                favoritFood: favoritFood
            )
        }
    }
}


struct pagesInProfile: View {
    let title: String
    let description: String
    var body: some View {
        VStack(spacing: 8) {
            Text(title)
                .font(.custom("Impact", size: 50))
            Text(description)
                .padding(20)
        }
        .padding()
        .glassEffect(in: .rect(cornerRadius: 16.0))
        .padding()
    }
}
