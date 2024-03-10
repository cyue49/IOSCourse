import SwiftUI

struct TodoItemsView: View {
    @Binding var todoList: [TodoItem]
    @State private var isAddingItem = false
    @State private var isEdditingItem = false
    
    var body: some View {
        NavigationStack {
            VStack {
//                List($todoList) { $todoItem in
//                    if (!todoItem.completed) {
//                        NavigationLink(destination: EditingItemView(item: $todoItem)) {
//                                HStack {
//                                    CheckboxStyle1(label: todoItem.title, checked: $todoItem.completed)
//                                    Spacer()
//                                    Text("temp")
//                                        .foregroundStyle(.gray)
//                                }
//                        }
//                    }
//                }
                List {
                    Section(header: Text("Upcoming")) {
                        ForEach($todoList) { $todoItem in
                            if (!todoItem.completed && !todoItem.deleted && todoItem.dueDate > Date()) {
                                NavigationLink(destination: EditingItemView(item: $todoItem)) {
                                        HStack {
                                            CheckboxStyle1(label: todoItem.title, checked: $todoItem.completed)
                                            Spacer()
                                            Text(todoItem.dueDate.description.prefix(10))
                                                .foregroundStyle(.gray)
                                        }
                                }
                            }
                        }
                    }
                    Section(header: Text("Overdue")) {
                        ForEach($todoList) { $todoItem in
                            if (!todoItem.completed && !todoItem.deleted && todoItem.dueDate < Date()) {
                                NavigationLink(destination: EditingItemView(item: $todoItem)) {
                                        HStack {
                                            CheckboxStyle1(label: todoItem.title, checked: $todoItem.completed)
                                            Spacer()
                                            Text(todoItem.dueDate.description.prefix(10))
                                                .foregroundStyle(.red)
                                        }
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
                NewItemSheetView(todoList: $todoList, isAddingItem: $isAddingItem)
            }
        }
    }
}

struct TodoItemView_Previews: PreviewProvider {
    static var previews: some View {
        TodoItemsView(todoList: .constant(TodoItem.sampleData))
    }
}
