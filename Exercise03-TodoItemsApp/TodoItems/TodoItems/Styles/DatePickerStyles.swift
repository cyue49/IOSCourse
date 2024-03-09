import SwiftUI

struct DatePickerStyle1: View {
    var label: String
    @Binding var date: Date
    
    var body: some View {
        VStack (alignment: .leading) {
            Text(label)
                .font(Font.headline.weight(.semibold))
            DatePicker(label, selection: $date)
                .datePickerStyle(.graphical)
                .accentColor(Color("PrimaryAccentColor"))
        }
    }
}

struct DatePickerStyles_Previews: PreviewProvider {
    static var previews: some View {
        DatePickerStyle1(label: "Due date", date: .constant(Date.now))
    }
}
