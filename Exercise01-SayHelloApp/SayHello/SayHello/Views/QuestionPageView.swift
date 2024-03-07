import SwiftUI

struct QuestionPageView: View {
    @State var name:String = ""
    @State var welcomeMessage:String = ""
    @State var welcomeLabelMessage:String = ""
    
    @State private var showAlert = false
    
    var body: some View {
        NavigationStack {
            VStack (alignment: .leading, spacing: 25) {
                Text("What is your name?")
                TextFieldStyle1(placeholder: "What is your name?", textValue: $name)
                
                ButtonStyle1(text: "Say Hello with Label") {
                    welcomeLabelMessage = "Hello \(name)! Welcome to SayHello App!"
                }
                
                NavigationLink(destination: WelcomeView(welcomeMessage: $welcomeMessage).onAppear() {
                    welcomeLabelMessage = ""
                    welcomeMessage = "Hello \(name)! Welcome to SayHello App!"
                }) {
                    TextButtonStyle1(text: "Say Hello with a Separate View")
                }
                
                ButtonStyle1(text: "Say Hello with Dialog Box") {
                    welcomeLabelMessage = ""
                    welcomeMessage = "Hello \(name)! Welcome to SayHello App!"
                    showAlert = true
                }
                .alert(welcomeMessage, isPresented: $showAlert) {
                    Button("Ok", role: .cancel) {}
                }
                
                Text(welcomeLabelMessage)
            }
            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
            .padding(20)
            Spacer()
        }
    }
}

struct QuestionPageView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionPageView()
    }
}
