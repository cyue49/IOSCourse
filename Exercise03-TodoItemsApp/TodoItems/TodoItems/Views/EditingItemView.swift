import SwiftUI

struct EditingItemView: View {
    @Binding var item: TodoItem
    
    var body: some View {
        NavigationStack {
            VStack (alignment: .leading, spacing: 20) {
                TextFieldWithLabel(label: "Task item: ", placeholder: "Task item", textValue: $item.title)
                TextFieldWithLabel(label: "Task description: ", placeholder: "Task description", textValue: $item.description)
                DatePickerStyle1(label: "Due date: ", date: $item.dueDate)
                Grid(alignment: .center, horizontalSpacing: 10) {
                    GridRow {
                        ButtonStyle3(text: "Delete task", clicked: {})
                        ButtonStyle1(text: "Save changes", clicked: {})
                    }
                }
                Spacer()
            }
            .padding()
            .navigationBarTitle(item.title, displayMode: .inline)
        }
    }
}

struct EditingItemView_Previews: PreviewProvider {
    static var previews: some View {
        EditingItemView(item: .constant(TodoItem.sampleData[0]))
    }
}
