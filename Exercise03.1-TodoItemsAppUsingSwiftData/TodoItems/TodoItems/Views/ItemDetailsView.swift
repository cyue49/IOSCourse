import SwiftUI

struct AddEditItemView: View {
    @Binding var item: TodoItem
    
    var body: some View {
        VStack (alignment: .leading, spacing: 20) {
            TextFieldWithLabel(label: "Task item: ", placeholder: "Task item", textValue: $item.title)
            TextFieldWithLabel(label: "Task description: ", placeholder: "Task description", textValue: $item.description)
            DatePickerStyle1(label: "Due date: ", date: $item.dueDate)
            Spacer()
        }
    }
}

struct AddingItemView_Previews: PreviewProvider {
    static var previews: some View {
        AddEditItemView(item: .constant(TodoItem.sampleData[0]))
    }
}
