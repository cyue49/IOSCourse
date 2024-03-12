import SwiftUI

struct EditingItemView: View {
    @Binding var item: TodoItem
    @Environment(\.dismiss) var dismiss
    @State var initialItem: TodoItem = TodoItem.emptyItem
    @State var edited:Bool = false
    
    var body: some View {
            VStack (alignment: .leading, spacing: 20) {
                AddEditItemView(item: $item)
                Grid(alignment: .center, horizontalSpacing: 10) {
                    GridRow {
                        ButtonStyle3(text: "Delete task", clicked: {
                            item.deleted = true
                            dismiss()
                        })
                        ButtonStyle1(text: "Save changes", clicked: {
                            edited = true
                            dismiss()
                        })
                    }
                }
            }
            .padding()
            .navigationBarTitle(item.title, displayMode: .inline)
            .onAppear(){
                initialItem = item
            }
            .onDisappear() {
                if (!edited) {
                    item = initialItem
                }
            }
        }
}

struct EditingItemView_Previews: PreviewProvider {
    static var previews: some View {
        EditingItemView(item: .constant(TodoItem.sampleData[0]))
    }
}
