import SwiftUI

struct TextFieldStyle1: View {
    var placeholder: String
    @Binding var textValue: String
    
    var body: some View {
        TextField("\(placeholder)", text: $textValue)
            .padding(10)
            .background(
                RoundedRectangle(cornerRadius: 15, style: .continuous)
                    .stroke(Color("PrimaryAccentColor"), lineWidth: 1))
    }
}

struct TextFieldStyles_Previews: PreviewProvider {
    static var previews: some View {
        TextFieldStyle1(placeholder: "Input", textValue: .constant("Input"))
    }
}
