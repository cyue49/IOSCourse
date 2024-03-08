import Foundation

struct User: Identifiable, Codable {
    let id: UUID
    var name: String
    var ageRange: String
    var likesCats: Bool
    var likesDogs: Bool
    var likesGuineaPigs: Bool
    var likesOther: Bool
    var continent: String
    var preferredTemperature: Double
    
    init(id: UUID = UUID(), name: String, ageRange: String, likesCats: Bool, likesDogs: Bool, likesGuineaPigs: Bool, likesOther: Bool, continent: String, preferredTemperature: Double) {
        self.id = id
        self.name = name
        self.ageRange = ageRange
        self.likesCats = likesCats
        self.likesDogs = likesDogs
        self.likesGuineaPigs = likesGuineaPigs
        self.likesOther = likesOther
        self.continent = continent
        self.preferredTemperature = preferredTemperature
    }
}

extension User {
    static var emptyUser: User {
        User(name: "", ageRange: "", likesCats: false, likesDogs: false, likesGuineaPigs: false, likesOther: false, continent: "North America", preferredTemperature: 0)
    }
}

extension User {
    static let sampleData: User = User(name: "Bob", ageRange: "Don't want to say", likesCats: true, likesDogs: true, likesGuineaPigs: true, likesOther: false, continent: "North America", preferredTemperature: 20)
}
