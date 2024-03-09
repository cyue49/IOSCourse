import Foundation

struct TodoItem: Identifiable {
    let id :UUID
    var title: String
    var description: String
    var dueDate: Date
    var completed: Bool
    
    init(id: UUID = UUID(), title: String, description: String, dueDate: Date, completed: Bool) {
        self.id = id
        self.title = title
        self.description = description
        self.dueDate = dueDate
        self.completed = completed
    }
}

extension TodoItem {
    static let sampleData: [TodoItem] =
    [
        TodoItem(title: "Math Exam", description: "Review for math exam", dueDate: Date(year: 2024, month: 6, day: 20), completed: false),
        TodoItem(title: "House Cleaning", description: "Wash the dishes and do laundry", dueDate: Date(year: 2024, month: 5, day: 12), completed: false)
    ]
}

extension Date {
    init(year: Int, month: Int, day: Int) {
        var dateComponents = DateComponents()
        dateComponents.year = year
        dateComponents.month = month
        dateComponents.day = day
        dateComponents.hour = 0
        dateComponents.minute = 0
        dateComponents.second = 0
        
        let date = Calendar(identifier: .gregorian).date(from: dateComponents)
        self.init(timeInterval: 0, since: date!)
    }
}
