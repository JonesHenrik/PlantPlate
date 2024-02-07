//
//  PickerView.swift
//  PlantPlate
//
//  Created by Henrik Jones on 2/1/24.
//

import SwiftUI

struct PickerView: View {
    @State private var selectedTime: Time = .supriseMe
    @State private var dishStyle: DishStyle = .breakfast
    
    // Main Pickers
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
                    Text("Preferred Time")
                        .font(.custom("Magica", size: 15, relativeTo: .headline))
                        .foregroundStyle(.title)

                    Picker("", selection: $selectedTime) {
                        Text("No limit").tag(Time.supriseMe)
                        Text("10 min").tag(Time.tenMin)
                        Text("20 min").tag(Time.twentyMin)
                        Text("30 min").tag(Time.thirtyMin)
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    .padding(.horizontal)
                    .accessibilityLabel(Text("Length of Recipe"))
                    .accessibilityHint(Text("Adjusts the time it will take to prepare the recipe"))

                    Text("Dish Style")
                        .font(.custom("Magica", size: 15, relativeTo: .headline))
                        .foregroundStyle(.title)
            
                    Picker("", selection: $dishStyle) {
                        Text("Breakfast").tag(DishStyle.breakfast)
                        Text("Lunch").tag(DishStyle.lunch)
                        Text("Dinner").tag(DishStyle.dinner)
                        Text("Snack").tag(DishStyle.snack)
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    .padding(.horizontal)
                    .accessibilityLabel(Text("Type of Dish"))
                    .accessibilityHint(Text("Adjusts the dish type for the recipe. This includes breakfast, lunch, dinner, or a snack."))
                }
                .padding()
                .background(RoundedRectangle(cornerRadius: 15).fill(Color.gray.opacity(0.1)))
            }
        }


struct ServingSizePicker: View {
    @Binding var servingSize: Int
    
    // Possible Serving Size View
    var body: some View {
        VStack(alignment: .leading) {
                    Text("Serving Size")
                        .font(.headline)

                    Picker("", selection: $servingSize) {
                        ForEach(1..<7) { size in
                            Text("\(size) \(size == 1 ? "person" : "people")")
                                .tag(size)
                        }
                    }
                    .pickerStyle(.inline)
                    .padding(.horizontal)
                }
                .padding()
                .background(RoundedRectangle(cornerRadius: 10).fill(Color.gray.opacity(0.1)))
    }
}

struct StepperView: View {
    @Binding var value: Int
    let step = 1
    
    // Possible Serving Size View
    var body: some View {
         Stepper("Current serving size: \(value)",
                 value: $value,
                 in: 1...6,
                 step: step)
         .padding(10)
    }
}

#Preview {
    PickerView()
}

#Preview {
    ServingSizePicker(servingSize: .constant(1))
}

#Preview {
    StepperView(value: .constant(1))
}
