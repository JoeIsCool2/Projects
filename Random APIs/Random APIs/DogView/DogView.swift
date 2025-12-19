import SwiftUI

struct Dog: Identifiable {
    let id = UUID()
    let picture: String
    var name: String
}

struct DogView: View {
    let dog = DogAPIController()
    
    @State private var imageURL: String? = nil
    @State private var dogData: DogPicture? = nil
    @State private var errorMessage: String? = nil
    @State private var allDogs: [Dog] = []
    @State private var currentDogName: String = ""
    @State private var selectedDog: Dog? = nil
    
    var body: some View {
        VStack {
            
            Spacer()
            if let imageURL {
                AsyncImage(url: URL(string: imageURL)) { phase in
                    switch phase {
                    case .empty:
                        ProgressView()
                    case .success(let image):
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    case .failure:
                        Image(systemName: "exclamationmark.triangle.fill")
                            .foregroundColor(.red)
                    @unknown default:
                        EmptyView()
                    }
                }
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .frame(width: .infinity)
                .modifier(BlackFrame())
                
                Text("Name")
                    .font(.custom("American Typewriter", size: 30))
                    .foregroundStyle(.black)
                    .padding(.top, 20)
                    .bold()
                
                TextField("Name", text: $currentDogName)
                    .tint(.black)
                    .foregroundStyle(.black)
                    .modifier(BlackFrame())
                
                Button("Save and Generate New Dog") {
                    
                    allDogs.append(Dog(picture: imageURL, name: currentDogName))
                    fetchDog()
                    currentDogName = ""
                    print(allDogs)
                }
                .font(.custom("American Typewriter", size: 30))
                .foregroundStyle(.black)
                .modifier(BlackFrameButton())
            } else {
                Button("Generate Dog") {
                    fetchDog()
                }
                .font(.custom("American Typewriter", size: 30))
                .foregroundStyle(.black)
                .modifier(BlackFrameButton())
                
            }
            if allDogs.count > 0 {
                List(allDogs, id: \.id) { dog in
                    HStack {
                        Text(dog.name)
                            .font(.custom("American Typewriter", size: 30))
                        Spacer()
                        AsyncImage(url: URL(string: dog.picture)) { phase in
                            switch phase {
                            case .empty: ProgressView()
                            case .success(let image):
                                image.resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 60, height: 60)
                                    .clipShape(RoundedRectangle(cornerRadius: 8))
                            case .failure:
                                Image(systemName: "exclamationmark.triangle.fill")
                                    .foregroundColor(.red)
                            @unknown default:
                                EmptyView()
                            }
                        }
                    }
                    .onTapGesture {
                        selectedDog = dog
                    }
                }
                .sheet(item: $selectedDog) { dog in
                    if let index = allDogs.firstIndex(where: { $0.id == dog.id }) {
                        DogEditView(
                            imageURL: dog.picture,
                            name: Binding(
                                get: { allDogs[index].name },
                                set: { newValue in allDogs[index].name = newValue }
                            ),
                            isEditing: $selectedDog
                        )
                    }
                }
                .modifier(BlackFrame())
            }
        }
        .padding()
        Spacer()
        
        if let errorMessage {
            Text(errorMessage)
                .foregroundColor(.red)
        }
    }
    
    func fetchDog() {
        Task {
            do {
                dogData = try await dog.fetchPicture()
                imageURL = dogData?.message
                errorMessage = nil
            } catch {
                errorMessage = "Failed to fetch dog picture."
            }
        }
    }
}

#Preview {
    DogView()
}
