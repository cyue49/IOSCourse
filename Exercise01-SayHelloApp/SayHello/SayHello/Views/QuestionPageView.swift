import SwiftUI

struct QuestionPageView: View {
    @State private var name:String = ""
    @State private var welcomeMessage:String = "test"
    
    var body: some View {
        VStack {
            VStack (alignment: .leading) {
                Text("What is your name?")
                TextField("Please enter your name", text: $name)
                    .padding(10)
                    .background(
                        RoundedRectangle(cornerRadius: 15, style: .continuous)
                            .stroke(Color.gray, lineWidth: 1))
                
                ButtonStyle1(text: "Say Hello with Label") {
                    welcomeMessage = "Hello \(name)! Welcome to SayHello App!"
                }
                
                ButtonStyle1(text: "Say Hello with Separate View") {
                    // todo
                }
                
                ButtonStyle1(text: "Say Hello with Dialog Box") {
                    // todo
                }
            }
            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
            
            Text(welcomeMessage)
            Spacer()
        }
        .padding()
    }
}

struct QuestionPageView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionPageView()
    }
}
