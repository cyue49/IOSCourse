import SwiftUI

struct FormPageView: View {
    @State var name = ""
    @State var user: User = User()
    
    var body: some View {
        let ageOptions = [
            RadioButtonStyle1(label: "Less than 18", selected: $user.ageRange),
            RadioButtonStyle1(label: "18 to 64", selected: $user.ageRange),
            RadioButtonStyle1(label: "65 or more", selected: $user.ageRange),
            RadioButtonStyle1(label: "Don't want to say", selected: $user.ageRange)
        ]
        
        let petOptions = [
            CheckboxStyle1(label: "Cats", checked: $user.likesCats),
            CheckboxStyle1(label: "Dogs", checked: $user.likesDogs),
            CheckboxStyle1(label: "Guinea pigs", checked: $user.likesGuineaPigs),
            CheckboxStyle1(label: "Other", checked: $user.likesOther)
        ]
        
        let columns = [
            GridItem(.flexible()),
            GridItem(.flexible())
        ]
        
        NavigationStack {
            VStack (alignment: .leading, spacing: 25) {
                Text("What is your name? (2-20 characters)")
                TextFieldStyle1(placeholder: "Please enter your name", textValue: $name)
                
                Text("What is your age range?")
                LazyVGrid(columns: columns, alignment: .leading, spacing: 20) {
                    ForEach((0..<ageOptions.count), id: \.self) { i in
                        ageOptions[i]
                    }
                }
                .padding(.horizontal)
                
                Text("What pets do you like?")
                LazyVGrid(columns: columns, alignment: .leading, spacing: 20) {
                    ForEach((0..<petOptions.count), id: \.self) { i in
                        petOptions[i]
                    }
                }
                .padding(.horizontal)
                
                // Text(user.likesCats ? "Yes" : "No")
                
                Text("Choose your continent of residence:")
                
                Text("What is your preferred temperature in celcuius?")
                
                ButtonStyle1(text: "Save Information and Display on Next Page") {}
            }
            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
            .padding(20)
            Spacer()
        }
    }
}

struct FormPageView_Previews: PreviewProvider {
    static var previews: some View {
        FormPageView()
    }
}
