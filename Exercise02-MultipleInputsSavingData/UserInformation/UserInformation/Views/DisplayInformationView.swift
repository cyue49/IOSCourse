import SwiftUI

struct DisplayInformationView: View {
    @Binding var user: User
    
    var body: some View {
        VStack {
            VStack(alignment: .leading, spacing: 25) {
                Text("User Information")
                Text("Name: \(user.name)")
                Text("Age range: \(user.ageRange)")
                Text("Continent of residence: \(user.continent)")
                Text("Pets user likes:")
                if (user.likesCats){
                    Label("Cats", systemImage: "circle.fill")
                }
                if (user.likesDogs){
                    Label("Dogs", systemImage: "circle.fill")
                }
                if (user.likesGuineaPigs){
                    Label("Guinea Pigs", systemImage: "circle.fill")
                }
                if (user.likesOther){
                    Label("Other", systemImage: "circle.fill")
                }
                Text("Preferred temperature: \(Int(user.preferredTemperature))")
            }
            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
            .padding(20)
            Spacer()
        }
    }
}

struct DisplayInformationView_Previews: PreviewProvider {
    static var previews: some View {
        DisplayInformationView(user: .constant(User.sampleData))
    }
}
