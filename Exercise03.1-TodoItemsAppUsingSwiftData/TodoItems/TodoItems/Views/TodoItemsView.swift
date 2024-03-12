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
                        .onDelete { items in
                            for i in items {
                                deleteItem(item: todoList[i])
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
                        .onDelete { items in
                            for i in items {
                                deleteItem(item: todoList[i])
                            }
                        }
                    }
                }
            }
            .navigationBarTitle("Todo Items", displayMode: .inline)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button (action: {
                        clearTodoList()
                    }) {
                        Text("Clear")
                    }
                }
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
    
    func deleteItem(item: TodoDataItem){
        context.delete(item)
        do {
            try context.save()
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func clearTodoList() {
        for listItem in todoList {
            deleteItem(item: listItem)
        }
    }
}

struct TodoItemView_Previews: PreviewProvider {
    static var previews: some View {
        TodoItemsView()
    }
}
