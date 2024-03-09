import SwiftUI

struct EditingItemView: View {
    @Binding var item: TodoItem
    
    var body: some View {
        NavigationStack {
            VStack {
                Text(item.description)
                Text(item.dueDate.description)
                Text(String(item.completed))
            }
            .navigationBarTitle(item.title, displayMode: .inline)
        }
    }
}

struct EditingItemView_Previews: PreviewProvider {
    static var previews: some View {
        EditingItemView(item: .constant(TodoItem.sampleData[0]))
    }
}
