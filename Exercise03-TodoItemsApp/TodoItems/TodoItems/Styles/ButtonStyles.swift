import SwiftUI

// using custom view
struct ButtonStyle1: View {
    var text: String
    var clicked: () -> Void
    
    var body: some View {
        Button(action: clicked) {
            Text(text)
                .frame(maxWidth: .infinity)
                .font(Font.headline.weight(.semibold))
        }
        .padding(15)
        .background(Color("PrimaryAccentColor"))
        .foregroundStyle(Color("FontColor"))
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
            .background(Color("PrimaryAccentColor"))
            .foregroundStyle(Color("FontColor"))
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .font(Font.headline.weight(.semibold))
    }
}

struct ButtonStyles_Previews: PreviewProvider {
    static var previews: some View {
        ButtonStyle1(text: "Button", clicked: {})
        TextButtonStyle1(text: "Button")
    }
}
