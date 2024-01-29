import Foundation

final class HomeViewModel: ObservableObject {
    @Published var animalsData: [Animal] = []
    
    private var service = ApiService()
    
    init() {
        loadAnimals()
    }
    
    func loadAnimals() {
        service.fetchAnimals { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let animal):
                    self.animalsData = animal
                case .failure: break
                }
            }
        }
    }
}
