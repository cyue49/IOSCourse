import SwiftUI

struct TodoItemsView: View {
    @Binding var todoList: [TodoItem]
    @State private var isAddingItem = false
    @State private var isEdditingItem = false
    
    @Environment(\.scenePhase) private var scenePhase
    let saveAction: ()->Void
    
    var body: some View {
        NavigationStack {
            VStack {
                List {
                    Section(header: Text("Upcoming")) {
                        ForEach($todoList) { $todoItem in
                            if (!todoItem.completed && todoItem.dueDate > Date()) {
                                NavigationLink(destination: EditingItemView(item: $todoItem)) {
                                        HStack {
                                            CheckboxStyle1(label: todoItem.title, checked: $todoItem.completed)
                                            Spacer()
                                            Text(todoItem.dueDate.formatted(date: .abbreviated, time: .omitted))
                                                .foregroundStyle(.gray)
                                        }
                                }
                            }
                        }
                    }
                    Section(header: Text("Overdue")) {
                        ForEach($todoList) { $todoItem in
                            if (!todoItem.completed && todoItem.dueDate < Date()) {
                                NavigationLink(destination: EditingItemView(item: $todoItem)) {
                                        HStack {
                                            CheckboxStyle1(label: todoItem.title, checked: $todoItem.completed)
                                            Spacer()
                                            Text(todoItem.dueDate.formatted(date: .abbreviated, time: .omitted))
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
            .onAppear(){
                todoList.removeAll(where: {
                    $0.deleted == true
                })
            }
            .sheet(isPresented: $isAddingItem) {
                NewItemSheetView(todoList: $todoList, isAddingItem: $isAddingItem)
            }
            .onChange(of: scenePhase) { phase in
                if phase == .inactive { saveAction() }
            }
        }
    }
}

struct TodoItemView_Previews: PreviewProvider {
    static var previews: some View {
        TodoItemsView(todoList: .constant(TodoItem.sampleData), saveAction: {})
    }
}
