import Foundation

struct User: Identifiable {
    let id:UUID = UUID()
    var ageRange = ""
    var likesCats = false
    var likesDogs = false
    var likesGuineaPigs = false
    var likesOther = false
}
