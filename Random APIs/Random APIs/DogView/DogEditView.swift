import SwiftUI

struct DogEditView: View {
    let imageURL: String
    @Binding var name: String
    @Binding var isEditing: Dog?
    
    var body: some View {
        NavigationStack {
            VStack {
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
                .modifier(BlackFrame())
                TextField("Name", text: $name)
                    .tint(.black)
                    .foregroundStyle(.black)
                    .modifier(BlackFrame())
            }
            .padding()
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Save") {
                        isEditing = nil
                    }
                }
            }
        }
    }
}
