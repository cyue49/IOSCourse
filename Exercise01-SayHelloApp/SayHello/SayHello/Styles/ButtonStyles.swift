import SwiftUI

// using button style
/* struct ButtonStyle1: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(15)
            .background(Color("PrimaryButtonColor"))
            .foregroundStyle(Color("PrimaryTextColor"))
            .clipShape(RoundedRectangle(cornerRadius: 20))
    }
}*/


// using custom view
struct ButtonStyle1: View {
    var text: String
    var clicked: () -> Void
    
    var body: some View {
        Button(action: clicked) {
            Text(text)
                .frame(maxWidth: .infinity)
        }
        .padding(15)
        .background(Color("PrimaryButtonColor"))
        .foregroundStyle(Color("PrimaryTextColor"))
        .clipShape(RoundedRectangle(cornerRadius: 20))
    }
}

// Text styled like ButtonStyle1
struct TextButtonStyle1: View {
    var text: String
    
    var body: some View {
        Text(text)
            .frame(maxWidth: .infinity)
            .padding(15)
            .background(Color("PrimaryButtonColor"))
            .foregroundStyle(Color("PrimaryTextColor"))
            .clipShape(RoundedRectangle(cornerRadius: 20))
    }
}
