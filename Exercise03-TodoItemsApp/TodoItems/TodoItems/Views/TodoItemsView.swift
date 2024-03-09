import SwiftUI

struct TodoItemsView: View {
    @Binding var todoList: [TodoItem]
    @State private var isAddingItem = false
    @State private var isEdditingItem = false
    
    var body: some View {
        NavigationStack {
            VStack {
                List($todoList) { $todoItem in
                    NavigationLink(destination: EditingItemView(item: $todoItem)) {
                        Button(action: {}) {
                            Text(todoItem.title)
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
                NavigationStack {
                    AddingItemView()
                        .navigationBarTitle("Adding Items", displayMode: .inline)
                        .toolbar {
                            ToolbarItem(placement: .cancellationAction) {
                                Button("Cancel") {
                                    isAddingItem = false
                                }
                            }
                            ToolbarItem(placement: .confirmationAction) {
                                Button("Done") {
                                    isAddingItem = false
                                }
                            }
                        }
                }
            }
        }
    }
}

struct TodoItemView_Previews: PreviewProvider {
    static var previews: some View {
        TodoItemsView(todoList: .constant(TodoItem.sampleData))
    }
}
