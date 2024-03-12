import SwiftUI
import SwiftData

struct EditingItemView: View {
    @Environment(\.modelContext) private var context
    @Environment(\.dismiss) var dismiss
    
    var item: TodoDataItem
    @State var itemCopy: TodoDataItem = TodoDataItem.emptyItem
    
    var body: some View {
        VStack (alignment: .leading, spacing: 20) {
            ItemDetailsView(item: $itemCopy)
            Grid(alignment: .center, horizontalSpacing: 10) {
                GridRow {
                    ButtonStyle2(text: "Delete task", clicked: {
                        deleteItem(item: item)
                        dismiss()
                    })
                    ButtonStyle1(text: "Save changes", clicked: {
                        saveChanges()
                        dismiss()
                    })
                }
            }
        }
        .padding()
        .navigationBarTitle(item.title, displayMode: .inline)
        .onAppear(){
            itemCopy = copyOfItem(item: item)
        }
    }
    
    func copyOfItem(item: TodoDataItem) -> TodoDataItem {
        return TodoDataItem(title: item.title, details: item.details, dueDate: item.dueDate, completed: item.completed)
    }
    
    func saveChanges() {
        item.title = itemCopy.title
        item.details = itemCopy.details
        item.dueDate = itemCopy.dueDate
        item.completed = itemCopy.completed
        do {
            try context.save()
        } catch {
            print(error.localizedDescription)
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
}

struct EditingItemView_Previews: PreviewProvider {
    static var previews: some View {
        EditingItemView(item: TodoDataItem.sampleData[0])
    }
}
