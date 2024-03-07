import SwiftUI

struct RadioButtonStyle1: View {
    var label: String
    @Binding var selected: String
    
    var body: some View {
        HStack {
            Image(systemName: (selected == label) ? "checkmark.circle.fill" : "circle")
                .foregroundColor(Color("PrimaryAccentColor"))
                .onTapGesture {
                    self.selected = label
            }
            Text(label)
        }
    }
}

struct RadioButtonStyles_Previews: PreviewProvider {
    static var previews: some View {
        RadioButtonStyle1(label: "Test", selected: .constant("Test"))
    }
}
