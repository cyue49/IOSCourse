import SwiftUI

struct DropdownPickerStyle1: View {
    var label: String
    var options: [String]
    @Binding var selected: String
    
    var body: some View {
        Picker(label, selection: $selected) {
            ForEach(options, id: \.self) {
                Text($0)
            }
        }
    }
}

struct DropdownPickerStyles_Previews: PreviewProvider {
    static var previews: some View {
        DropdownPickerStyle1(label: "Test", options: ["Option 1", "Option 2"], selected: .constant("Test"))
    }
}

