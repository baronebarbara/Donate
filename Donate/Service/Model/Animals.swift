import Foundation

struct Animal: Codable, Identifiable {
    var id = UUID()
    let image: String
    let name: String
    let location: String
    let age: String
    let gender: String
    let specie: String
    let description: String
    let breed: String?
    let phone: String?
    let email: String?
}
