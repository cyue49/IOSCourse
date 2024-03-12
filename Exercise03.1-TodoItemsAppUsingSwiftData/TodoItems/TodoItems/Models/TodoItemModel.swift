import Foundation
import SwiftData

@Model
class TodoDataItem: Identifiable, ObservableObject {
    let id :UUID
    var title: String
    var details: String
    var dueDate: Date
    var completed: Bool
    
    init(id: UUID = UUID(), title: String, details: String, dueDate: Date, completed: Bool) {
        self.id = id
        self.title = title
        self.details = details
        self.dueDate = dueDate
        self.completed = completed
    }
}

extension TodoDataItem {
    static var emptyItem: TodoDataItem {
        TodoDataItem(title: "", details: "", dueDate: Date(), completed: false)
    }
    
    static let sampleData: [TodoDataItem] =
    [
        TodoDataItem(title: "Math Exam", details: "Review for math exam", dueDate: Date(year: 2024, month: 6, day: 20), completed: false),
        TodoDataItem(title: "House Cleaning", details: "Wash the dishes and do laundry", dueDate: Date(year: 2024, month: 5, day: 12), completed: false),
        TodoDataItem(title: "Reply Email", details: "Reply to work email", dueDate: Date(year: 2024, month: 3, day: 8), completed: false)
    ]
}
