import SwiftUI
import SwiftData

struct TodoItemsView: View {
    @Environment(\.modelContext) private var context
    
    @Query private var  todoList: [TodoDataItem]
    @State private var isAddingItem = false
    
    var body: some View {
        NavigationStack {
            VStack {
                List {
                    Section(header: Text("Upcoming")) {
                        ForEach(todoList) { todoItem in
                            if (!todoItem.completed && todoItem.dueDate > Date()) {
                                NavigationLink(destination: EditingItemView(item: todoItem)) {
                                    TodoItemCheckboxView(item: todoItem)
                                }
                            }
                        }
                    }
                    Section(header: Text("Overdue")) {
                        ForEach(todoList) { todoItem in
                            if (!todoItem.completed && todoItem.dueDate < Date()) {
                                NavigationLink(destination: EditingItemView(item: todoItem)) {
                                    TodoItemCheckboxView(item: todoItem)
                                }
                            }
                        }
                    }
                }
            }
            .navigationBarTitle("Todo Items", displayMode: .inline)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button (action: {
                        isAddingItem = true
                    }) {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $isAddingItem) {
                NewItemSheetView(isAddingItem: $isAddingItem)
            }
        }
    }
}

//struct TodoItemView_Previews: PreviewProvider {
//    static var previews: some View {
//        TodoItemsView(todoList: .constant(TodoItem.sampleData))
//    }
//}
