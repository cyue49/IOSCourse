import SwiftUI

struct NewItemSheetView: View {
    @Binding var todoList: [TodoItem]
    @Binding var isAddingItem: Bool
    @State var newTask: TodoItem = TodoItem.emptyItem
    
    var body: some View {
        NavigationStack {
            AddEditItemView(item: $newTask)
                .padding()
                .navigationBarTitle("Adding Items", displayMode: .inline)
                .toolbar {
                    ToolbarItem(placement: .cancellationAction) {
                        Button("Cancel") {
                            isAddingItem = false
                        }
                    }
                    ToolbarItem(placement: .confirmationAction) {
                        Button("Done") {
                            todoList.append(newTask)
                            isAddingItem = false
                        }
                    }
                }
        }
    }
}

struct NewItemSheet_Previews: PreviewProvider {
    static var previews: some View {
        NewItemSheetView(todoList: .constant(TodoItem.sampleData), isAddingItem: .constant(true))
    }
}
