import SwiftUI

struct EditingItemView: View {
    @Binding var title: String
    @Binding var description: String
    
    var body: some View {
        NavigationStack {
            VStack {
                Text(description)
            }
            .navigationBarTitle(title, displayMode: .inline)
        }
    }
}

struct EditingItemView_Previews: PreviewProvider {
    static var previews: some View {
        EditingItemView(title: .constant("Exam"), description: .constant("Review for exam"))
    }
}
