import Foundation

struct TodoItem: Identifiable {
    let id :UUID
    var title: String
    var description: String
    
    init(id: UUID = UUID(), title: String, description: String) {
        self.id = id
        self.title = title
        self.description = description
    }
}

extension TodoItem {
    static let sampleData: [TodoItem] =
    [
        TodoItem(title: "Math Exam", description: "Review for math exam"),
        TodoItem(title: "House Cleaning", description: "Wash the dishes and do laundry")
    ]
}
