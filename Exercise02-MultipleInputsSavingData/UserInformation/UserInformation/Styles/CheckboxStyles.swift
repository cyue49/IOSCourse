import SwiftUI

struct CheckboxStyle1: View {
    var label: String
    @Binding var checked: Bool
    
    var body: some View {
        HStack {
            Image(systemName: checked ? "checkmark.square.fill" : "square")
                .foregroundColor(Color("PrimaryAccentColor"))
                .onTapGesture {
                    self.checked.toggle()
            }
            Text(label)
        }
    }
}

struct CheckboxStyles_Previews: PreviewProvider {
    static var previews: some View {
        CheckboxStyle1(label: "Test", checked: .constant(false))
    }
}
