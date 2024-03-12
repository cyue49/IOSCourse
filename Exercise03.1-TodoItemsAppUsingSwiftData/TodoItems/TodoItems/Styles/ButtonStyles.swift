import SwiftUI

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
        .foregroundStyle(Color("ButtonFontColor"))
        .clipShape(RoundedRectangle(cornerRadius: 20))
    }
}

struct ButtonStyle2: View {
    var text: String
    var clicked: () -> Void
    
    var body: some View {
        Button(action: clicked) {
            Text(text)
                .frame(maxWidth: .infinity)
                .font(Font.headline.weight(.semibold))
        }
        .padding(15)
        .background(.red)
        .foregroundStyle(Color("ButtonFontColor"))
        .clipShape(RoundedRectangle(cornerRadius: 20))
    }
}

struct ButtonStyles_Previews: PreviewProvider {
    static var previews: some View {
        ButtonStyle2(text: "Button", clicked: {})
    }
}
