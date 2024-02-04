import SwiftUI

struct InitialView: View {
    @State private var showHomeView = false
    
    var body: some View {
        ZStack {
            Color.pink.opacity(0.2).edgesIgnoringSafeArea(.all)
            VStack {
                Text("Donate")
                    .font(.callout)
                    .foregroundColor(.gray)
                Text("Adoção é um ato de amor e responsabilidade")
                    .font(.title).bold()
                    .foregroundColor(.gray)
                    .padding(.top)
                Spacer()
                Image("pets_and_family")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(.bottom) 
                Spacer()
                VStack(spacing: 30) {
                    Button(action: {
                        showHomeView = true
                    }) {
                        Text("Quero adotar")
                            .font(.headline)
                            .foregroundColor(.gray)
                            .padding(EdgeInsets(top: 30, leading: 20, bottom: 30, trailing: 20))
                            .frame(maxWidth: .infinity)
                            .background(Color.orange.opacity(0.5))
                            .cornerRadius(20)
                            .sheet(isPresented: $showHomeView) {
                                HomeView()
                            }
                    }
                    Button(action: {}) {
                        Text("Quero divulgar um animal")
                            .font(.headline)
                            .foregroundColor(.gray)
                            .padding(EdgeInsets(top: 30, leading: 20, bottom: 30, trailing: 20))
                            .frame(maxWidth: .infinity)
                            .background(Color.purple.opacity(0.4))
                            .cornerRadius(20)
                    }
                }
                .padding(.horizontal)
                Spacer()
            }
        }
    }
}

#Preview {
    InitialView()
}
