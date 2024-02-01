//
//  FilterView.swift
//  PlantPlate
//
//  Created by Henrik Jones on 2/1/24.
//

import SwiftUI

struct FilterView: View {
    @Binding var allergy: String
    @Binding var isGlutenFree: Bool
    @Binding var dietType: DietType
    @Binding var presentFilterSheet: Bool
    
    var body: some View {
        NavigationStack {
            List {
                VStack {
                    Toggle("Gluten-Free", isOn: $isGlutenFree)
                    Divider()
                    HStack {
                        Text("Preferred Diet")
                        Spacer()
                        Picker("", selection: $dietType) {
                            Text("None").tag(DietType.none)
                            Text("Whole Food").tag(DietType.wholeFood)
                            Text("Raw Food").tag(DietType.rawFood)
                            Text("80/10/10").tag(DietType.eightyTenTen)
                            Text("Keto").tag(DietType.keto)
                            Text("Alkaline").tag(DietType.alkaline)
                            Text("Junk Food").tag(DietType.junkFood)
                            Text("Weight Loss").tag(DietType.veganForWeightLoss)
                        }
                        
                    }
                    .pickerStyle(.automatic)
                    Divider()
                    HStack {
                        Text("Please list your allergies below:")
                        Spacer()
                    }
                    
                    TextField("Allergies and Intolorences", text: $allergy)
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 15)
                                .fill(Color.gray.opacity(0.1)))
                    
                }
                .padding(.horizontal)
                .navigationTitle("Preferences")
                .toolbar {
                    ToolbarItem {
                        Button("Save") {
                            presentFilterSheet.toggle()
                        }
                        // Fails contrast test in Dark Mode
                        .foregroundStyle(Color("ButtonColor"))
                    }
                }
            }
            .scrollDisabled(true)
        }
    }
}

#Preview {
    FilterView(allergy: .constant(""), isGlutenFree: .constant(false), dietType: .constant(.none), presentFilterSheet: .constant(false))
}
