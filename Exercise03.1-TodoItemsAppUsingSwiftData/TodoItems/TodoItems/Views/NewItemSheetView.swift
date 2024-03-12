import SwiftUI
import SwiftData

struct NewItemSheetView: View {
    @Environment(\.modelContext) private var context
    
    @Binding var isAddingItem: Bool
    @State var newItem: TodoDataItem = TodoDataItem.emptyItem
    
    var body: some View {
        NavigationStack {
            ItemDetailsView(item: $newItem)
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
                            addItem(item: newItem)
                            isAddingItem = false
                        }
                    }
                }
        }
    }
    
    func addItem(item: TodoDataItem) {
        context.insert(newItem)
        do {
            try context.save()
        } catch {
            print(error.localizedDescription)
        }
    }
}

struct NewItemSheet_Previews: PreviewProvider {
    static var previews: some View {
        NewItemSheetView(isAddingItem: .constant(true))
    }
}
