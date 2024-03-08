import SwiftUI

struct DisplayInformationView: View {
    @Binding var user: User
    
    var body: some View {
        NavigationStack {
            Grid (alignment: .topLeading, verticalSpacing: 40) {
                GridRow {
                    Text("Name: ")
                    Text("\(user.name)")
                }
                Divider()
                GridRow {
                    Text("Age range: ")
                    Text("\(user.ageRange)")
                }
                Divider()
                GridRow {
                    Text("Pets user likes:")
                    VStack(alignment: .leading, spacing: 10) {
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
                        if (user.likesCats == false && user.likesDogs == false && user.likesGuineaPigs == false && user.likesOther == false){
                            Text("None")
                        }
                    }
                }
                Divider()
                GridRow {
                    Text("Preferred temperature: ")
                    Text("\(Int(user.preferredTemperature))")
                }
            }
            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
            .padding(20)
            Spacer()
        }
        .navigationTitle("User Information")
    }
}

struct DisplayInformationView_Previews: PreviewProvider {
    static var previews: some View {
        DisplayInformationView(user: .constant(User.sampleData))
    }
}
