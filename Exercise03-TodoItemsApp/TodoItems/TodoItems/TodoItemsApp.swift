import SwiftUI

@main
struct TodoItemsApp: App {
    // @State private var todoList = TodoItem.sampleData
    @StateObject private var store = TodoItemStore()
    
    var body: some Scene {
        WindowGroup {
            TodoItemsView(todoList: $store.items) {
                Task {
                    do {
                        try await store.save(items: store.items)
                        print(store.temp)
                    } catch {
                        fatalError(error.localizedDescription)
                    }
                }
            }
            .task {
                do {
                    try await store.load()
                } catch {
                    fatalError(error.localizedDescription)
                }
            }
        }
    }
}
