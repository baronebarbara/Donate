import SwiftUI

struct DetailView: View {
    let animalImages: [String] // Este array será usado quando você tiver as imagens
    let columns = [GridItem(.fixed(246))]
    
    var body: some View {
        ZStack {
            Color.pink.opacity(0.3)
                .edgesIgnoringSafeArea(.top)
            
            VStack(alignment: .leading, spacing: 16) {
                Spacer().frame(height: 20)
                
                Text("Akina")
                    .font(.title).bold()
                    .foregroundColor(.gray)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHGrid(rows: columns, spacing: 20) {
                        ForEach(0..<10, id: \.self) { _ in
                            Rectangle()
                                .fill(Color.pink.opacity(0.6))
                                .frame(width: 200, height: 200)
                                .cornerRadius(30)
                        }
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.bottom, 10)
                
                Group {
                    Text("Sobre")
                        .font(.title2).bold()
                        .foregroundColor(.gray)
                    Text("De")
                        .font(.title3).bold()
                        .foregroundColor(.gray)
                    Text("São Paulo - SP")
                        .font(.title3)
                        .foregroundColor(.black)
                    Text("Características")
                        .font(.title3).bold()
                        .foregroundColor(.gray)
                    Text("Dócil, fofa, brincalhona e quer um lar para brincar e ser feliz <3")
                        .font(.title3)
                        .foregroundColor(.black)
                }
            }
            .padding([.horizontal, .bottom])
            .background(Color.white)
            .cornerRadius(30, corners: [.topLeft, .topRight])
            .offset(y: 100)
            .edgesIgnoringSafeArea(.bottom)
        }
    }
}

// Extensão para arredondar cantos específicos
extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners))
    }
}

struct RoundedCorner: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(animalImages: [])
    }
}
