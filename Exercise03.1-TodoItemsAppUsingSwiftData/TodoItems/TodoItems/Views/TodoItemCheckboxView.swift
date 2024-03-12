import SwiftUI
import SwiftData

struct TodoItemCheckboxView: View {
    @Environment(\.modelContext) private var context
    
    var item: TodoDataItem
    @State var checked: Bool = false
    
    var body: some View {
        HStack {
            Image(systemName: checked ? "checkmark.square.fill" : "square")
                .foregroundColor(Color("PrimaryAccentColor"))
                .onTapGesture {
                    self.checked.toggle()
                    item.completed = true
                    do {
                        try context.save()
                    } catch {
                        print(error.localizedDescription)
                    }
            }
            Text(item.title)
            Spacer()
            Text(item.dueDate.formatted(date: .abbreviated, time: .omitted))
                .foregroundStyle(.gray)
        }
    }
}

//struct TodoItemCheckbox_Previews: PreviewProvider {
//    static var previews: some View {
//        TodoItemCheckboxView(item: TodoDataItem.sampleData[0])
//    }
//}
