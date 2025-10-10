import SwiftUI

struct Profile: View {
    let name: String
    let photo: String
    let shortDescription: String
    let longDescription: String
    let favoritFood: String
    
    var body: some View {
        ZStack {
            AnimatedBackground()
            ScrollView {
                VStack {
                    Image(photo)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 200, height: 200)
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color.white.opacity(0.3), lineWidth: 2))
                        .shadow(radius: 4)
                    Text(name)
                        .font(.custom("Impact", size: 100))
                        .padding(.vertical, -10)
                    pagesInProfile(title: "About", description: longDescription)
                    pagesInProfile(title: "Favorit Food", description: favoritFood)
                }
            }
        }
    }
}



#Preview {
    Profile(name: "Joe",
            photo: "JoeProfilePic",
            shortDescription: "He's pretty cool.",
            longDescription: "Joe brings calm to chaos. He’s thoughtful, clever, and always ready to help. Whether it’s fixing a bug or planning a family hike, he’s the go-to guy who makes things happen without making a fuss.",
            favoritFood: "Pizza, Steak, IceCream"
            )
}
