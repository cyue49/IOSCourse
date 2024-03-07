import SwiftUI

struct QuestionPageView: View {
    @State private var name:String = ""
    @State private var welcomeMessage:String = ""
    
    var body: some View {
        VStack (spacing: 25) {
            VStack (alignment: .leading, spacing: 25) {
                Text("What is your name?")
                TextFieldStyle1(placeholder: "What is your name?", textValue: $name)
                
                ButtonStyle1(text: "Say Hello with Label") {
                    welcomeMessage = "Hello \(name)! Welcome to SayHello App!"
                }
                
                ButtonStyle1(text: "Say Hello with Separate View") {
                    welcomeMessage = ""
                }
                
                ButtonStyle1(text: "Say Hello with Dialog Box") {
                    welcomeMessage = ""
                }
            }
            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
            
            Text(welcomeMessage)
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
            Spacer()
        }
        .padding(20)
    }
}

struct QuestionPageView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionPageView()
    }
}
