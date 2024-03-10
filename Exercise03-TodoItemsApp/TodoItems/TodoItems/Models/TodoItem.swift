import Foundation

struct TodoItem: Identifiable {
    let id :UUID
    var title: String
    var description: String
    var dueDate: Date
    var completed: Bool
    var deleted: Bool
    
    init(id: UUID = UUID(), title: String, description: String, dueDate: Date, completed: Bool, deleted: Bool) {
        self.id = id
        self.title = title
        self.description = description
        self.dueDate = dueDate
        self.completed = completed
        self.deleted = deleted
    }
}

extension TodoItem {
    static var emptyItem: TodoItem {
        TodoItem(title: "", description: "", dueDate: Date(), completed: false, deleted: false)
    }
    
    static let sampleData: [TodoItem] =
    [
        TodoItem(title: "Math Exam", description: "Review for math exam", dueDate: Date(year: 2024, month: 6, day: 20), completed: false, deleted: false),
        TodoItem(title: "House Cleaning", description: "Wash the dishes and do laundry", dueDate: Date(year: 2024, month: 5, day: 12), completed: false, deleted: false),
        TodoItem(title: "Reply Email", description: "Reply to work email", dueDate: Date(year: 2024, month: 3, day: 8), completed: false, deleted: false)
    ]
}

extension Date {
    init(year: Int, month: Int, day: Int) {
        let date = Calendar(identifier: .gregorian).date(from: DateComponents(year: year, month: month, day: day, hour: 0, minute: 0, second: 0))
        self.init(timeInterval: 0, since: date!)
    }
}
