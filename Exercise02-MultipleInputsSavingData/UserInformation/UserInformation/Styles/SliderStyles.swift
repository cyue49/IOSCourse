import SwiftUI

struct SliderStyle1: View {
    @Binding var value: Double
    var minValue: Double
    var maxValue: Double
    var step: Double
    
    var body: some View {
        VStack (spacing: 15) {
            Slider(value: $value, in: minValue...maxValue, step: step) {
            } minimumValueLabel: {
                Text(String(Int(minValue)))
            } maximumValueLabel: {
                Text(String(Int(maxValue)))
            }
            .tint(Color("PrimaryAccentColor"))
            Text("\(Int(value))")
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
        }
    }
}

struct SliderStyles_Previews: PreviewProvider {
    static var previews: some View {
        SliderStyle1(value: .constant(3), minValue: -50, maxValue: 50, step: 1)
    }
}
