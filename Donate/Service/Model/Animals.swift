import Foundation

struct Animal: Codable, Identifiable {
    var id = UUID()
    let animalImage: String
    let animalName: String
}
