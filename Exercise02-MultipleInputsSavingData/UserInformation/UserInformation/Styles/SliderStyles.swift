import SwiftUI

struct SliderStyle1: View {
    @Binding var value: Double
    var minValue: Double
    var maxValue: Double
    var step: Double
    
    var body: some View {
        Slider(value: $value, in: minValue...maxValue, step: step) {
            Text("\(value)")
        } minimumValueLabel: {
            Text(String(Int(minValue)))
        } maximumValueLabel: {
            Text(String(Int(maxValue)))
        }
        .tint(Color("PrimaryAccentColor"))
    }
}

struct SliderStyles_Previews: PreviewProvider {
    static var previews: some View {
        SliderStyle1(value: .constant(3), minValue: -50, maxValue: 50, step: 1)
    }
}
