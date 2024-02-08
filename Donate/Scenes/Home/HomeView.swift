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
                    ForEach(0..<10, id: \.self) { animal in
                        VStack {
                            Rectangle()
                                .fill(Color.pink.opacity(0.6))
                                .frame(width: 162, height: 162)
                                .cornerRadius(30)
                            Text("Akina")
                                .font(.title3).bold()
                                .foregroundColor(.gray)
//                            Image(animal.image)
//                                .resizable()
//                                .background(Color.pink.opacity(0.4))
//                                .frame(width: 162, height: 162)
//                                .cornerRadius(30)
//                            Text(animal.name)
//                                .font(.headline)
//                                .foregroundColor(.gray)
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
