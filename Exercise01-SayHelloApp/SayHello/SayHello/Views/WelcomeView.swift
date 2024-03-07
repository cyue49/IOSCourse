import SwiftUI

struct WelcomeView: View {
    @Binding var welcomeMessage:String
    
    var body: some View {
        NavigationStack {
                Text(welcomeMessage)
        }
        .onDisappear() {
            welcomeMessage = ""
        }
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView(welcomeMessage: .constant("Hello Bob! Welcome to SayHello App!"))
    }
}
