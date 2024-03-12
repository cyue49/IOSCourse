import SwiftUI

@main
struct TodoItemsApp: App {
    // @State private var todoList = TodoItem.sampleData
    @State private var todoList = TodoItem.sampleData
    
    var body: some Scene {
        WindowGroup {
            TodoItemsView(todoList: $todoList)
        }
    }
}
