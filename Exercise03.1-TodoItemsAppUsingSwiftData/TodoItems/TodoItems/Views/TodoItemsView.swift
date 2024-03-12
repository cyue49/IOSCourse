import SwiftUI
import SwiftData

struct TodoItemsView: View {
    @Environment(\.modelContext) private var context
    
    @Query private var  todoList: [TodoDataItem]
    @State private var isAddingItem = false
    @State private var showConfirmDelete = false
    
    @State private var searchText = ""
    var filteredTodoList: [TodoDataItem] {
        guard !searchText.isEmpty else { return todoList }
        return todoList.filter { item in
            item.title.lowercased().contains(searchText.lowercased())
        }
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                List {
                    Section(header: Text("Upcoming")) {
                        ForEach(filteredTodoList) { todoItem in
                            if (!todoItem.completed && todoItem.dueDate > Date()) {
                                NavigationLink(destination: EditingItemView(item: todoItem)) {
                                    TodoItemCheckboxView(item: todoItem)
                                }
                            }
                        }
//                        .onDelete { items in
//                            for i in items {
//                                deleteItem(item: todoList[i])
//                            }
//                        }
                    }
                    Section(header: Text("Overdue")) {
                        ForEach(filteredTodoList) { todoItem in
                            if (!todoItem.completed && todoItem.dueDate < Date()) {
                                NavigationLink(destination: EditingItemView(item: todoItem)) {
                                    TodoItemCheckboxView(item: todoItem)
                                }
                            }
                        }
//                        .onDelete { items in
//                            for i in items {
//                                deleteItem(item: todoList[i])
//                            }
//                        }
                    }
                }
            }
            .navigationBarTitle("Todo Items", displayMode: .inline)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button (action: {
                        showConfirmDelete.toggle()
                    }) {
                        Text("Clear")
                    }
                    .confirmationDialog(
                        "Clear all todo items?",
                        isPresented: $showConfirmDelete,
                        titleVisibility: .visible) {
                            Button("Yes", role: .destructive) {
                                clearTodoList()
                            }
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
        .searchable(text: $searchText)
    }
    
    func clearTodoList() {
        for listItem in todoList {
            context.delete(listItem)
            do {
                try context.save()
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}

struct TodoItemView_Previews: PreviewProvider {
    static var previews: some View {
        TodoItemsView()
    }
}
