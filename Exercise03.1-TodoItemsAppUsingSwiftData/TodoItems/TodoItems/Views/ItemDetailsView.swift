import SwiftUI

struct ItemDetailsView: View {
    @Binding var item: TodoDataItem
    
    var body: some View {
        VStack (alignment: .leading, spacing: 20) {
            TextFieldWithLabel(label: "Task item: ", placeholder: "Task item", textValue: $item.title)
            TextFieldWithLabel(label: "Task description: ", placeholder: "Task description", textValue: $item.details)
            DatePickerStyle1(label: "Due date: ", date: $item.dueDate)
            Spacer()
        }
    }
}

struct ItemDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        ItemDetailsView(item: .constant(TodoDataItem.sampleData[0]))
    }
}
