import SwiftUI

struct HomeView: View {
    @ObservedObject var viewModel = HomeViewModel()
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 16) {
                    ForEach(viewModel.animalsData) { animal in
                        VStack {
                            Image(animal.animalImage)
                                .resizable()
                                .background(Color.pink.opacity(0.4))
                                .frame(width: 162, height: 162)
                                .cornerRadius(30)
                            Text(animal.animalName)
                                .font(.headline)
                                .foregroundColor(.gray)
                        }
                    }
                }.padding()
            }.navigationTitle("Animais")
        }
    }
}

#Preview {
    HomeView()
}
