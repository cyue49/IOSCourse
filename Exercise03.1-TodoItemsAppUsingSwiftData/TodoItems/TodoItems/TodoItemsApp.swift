import SwiftUI
import SwiftData

@main
struct TodoItemsApp: App {
    var body: some Scene {
        WindowGroup {
            TodoItemsView()
        }
        .modelContainer(for: TodoDataItem.self)
    }
}
