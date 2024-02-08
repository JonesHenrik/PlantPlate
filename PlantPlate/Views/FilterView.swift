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
        ZStack {
            Color.background.ignoresSafeArea()
            VStack {
                HStack {
                    Text("Preferences")
                        .font(.custom("Magica", size: 30, relativeTo: .title))
                        .foregroundStyle(Color("titleColor"))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.top)
                        .padding(.trailing)
                        .padding(.trailing)
                    
                    Button("Save") {
                        presentFilterSheet.toggle()
                        UIImpactFeedbackGenerator(style: .light).impactOccurred()
                    }
                    .foregroundStyle(Color("secondaryButton"))
                    .buttonStyle(.automatic)
                    .accessibility(label: Text("Save Button"))
                    .accessibility(hint: Text("Saving will retain your inputs and allow you to return to the generate screen"))
                    .accessibilityAddTraits(.isButton)
                }
                .padding(.horizontal)
                Spacer()
                VStack {
                    Toggle("Gluten-Free", isOn: $isGlutenFree)
                        .accessibilityAddTraits(.isToggle)
                        .accessibilityLabel(Text("Gluten-Free Toggle"))
                        .accessibilityHint(Text("If you are gluten-free, this will modify the recipe into a gluten-free recipe."))
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
                    .accessibilityLabel(Text("Preferred Diet"))
                    .accessibilityHint(Text("If you follow a specific vegan diet, this will modify the recipe that will follow that diet as well."))
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
                        .accessibilityLabel(Text("Add Allergies and Intolorences"))
                        .accessibilityHint(Text("Enter any allergies or intolorences you may have. The recipe will be modified to fit your needs."))
                }
                .padding(.horizontal)
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                Spacer()
            }
            }
            
        }
}

#Preview {
    FilterView(allergy: .constant(""), isGlutenFree: .constant(false), dietType: .constant(.none), presentFilterSheet: .constant(false))
}
