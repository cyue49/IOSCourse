import SwiftUI

struct TextFieldWithLabel: View {
    var label: String
    var placeholder: String
    @Binding var textValue: String
    
    var body: some View {
        VStack (alignment: .leading) {
            Text(label)
                .font(Font.headline.weight(.semibold))
            TextField("\(placeholder)", text: $textValue)
                .padding(10)
                .background(
                    RoundedRectangle(cornerRadius: 15, style: .continuous)
                        .stroke(Color("PrimaryAccentColor"), lineWidth: 1))
        }
    }
}

struct TextFieldStyles_Previews: PreviewProvider {
    static var previews: some View {
        TextFieldWithLabel(label: "Question", placeholder: "Input", textValue: .constant("Input"))
    }
}
