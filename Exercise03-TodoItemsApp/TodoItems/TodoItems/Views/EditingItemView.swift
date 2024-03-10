import SwiftUI

struct EditingItemView: View {
    @Binding var item: TodoItem
    
    var body: some View {
            VStack (alignment: .leading, spacing: 20) {
                AddEditItemView(item: $item)
                Grid(alignment: .center, horizontalSpacing: 10) {
                    GridRow {
                        ButtonStyle3(text: "Delete task", clicked: {
                            item.deleted = true
                        })
                        ButtonStyle1(text: "Save changes", clicked: {})
                    }
                }
            }
            .padding()
            .navigationBarTitle(item.title, displayMode: .inline)
        }
}

struct EditingItemView_Previews: PreviewProvider {
    static var previews: some View {
        EditingItemView(item: .constant(TodoItem.sampleData[0]))
    }
}
