import Foundation

struct User: Identifiable {
    let id:UUID = UUID()
    var name = ""
    var ageRange = ""
    var likesCats = false
    var likesDogs = false
    var likesGuineaPigs = false
    var likesOther = false
    var continent = "North America"
    var preferredTemperature:Double = 0
}

extension User {
    static let sampleData: User = User(name: "Bob", ageRange: "Don't want to say", likesCats: true, likesDogs: true, likesGuineaPigs: true, likesOther: false, continent: "North America", preferredTemperature: 20)
}
