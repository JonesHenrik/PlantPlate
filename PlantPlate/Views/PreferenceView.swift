//
//  PreferenceView.swift
//  PlantPlate
//
//  Created by Henrik Jones on 2/1/24.
//

import SwiftUI

struct PreferenceView: View {
    // Mutable Variables on Plant Plate Screen
    @State private var selectedTime: Time = .supriseMe
    @State private var dishStyle: DishStyle = .dinner
    @State private var servingSize: Int = 1
    @State private var value = 1
    @State private var ingredient = ""
    @State private var presentSheet = false
    @State private var presentFilterSheet = false
    @StateObject private var viewModel = ChatViewModel()
    
    // Mutable Variable on Filter Screen
    @State public var allergy = ""
    @State public var isGlutenFree = false
    @State public var dietType: DietType = .none
    
    // Accessibility Functionality
    
    var body: some View {
        NavigationStack {
            VStack {
                VStack {
                    PickerView()
                   // ServingSizePicker(servingSize: .constant(1))
                    StepperView(value: $value)
                }
                .padding(.horizontal)
                TextField("Add Ingredients", text: $ingredient)
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 15)
                            .fill(Color.gray.opacity(0.1)))
                    .padding()
                Spacer()
                Button(action: {
                    presentSheet.toggle()
                  //  viewModel.sendChatGPTRequest(prompt: masterPrompt + ingredient + dishStyleSelection(dishStyle) + timeSelection(selectedTime) + allergens(allergy) + glutenFree(isGlutenFree) + diet(dietType) + serving(value), apiKey: Secrets.apiKey)
                    print(ingredient)
                }, label: {
                    ButtonView(text: "Generate Recipe")
                })
                .buttonStyle(.automatic)
                .sheet(
                    isPresented: $presentSheet,
                    content: {
                        ScrollView {
                            Text("\(viewModel.generatedText)")
                                .padding()
                        }
                    })
                .navigationTitle("Plant Plate")
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        Button(action: {
                            presentFilterSheet.toggle()
                        }) {
                            FilterButtonView()
                        }
                        .sheet(isPresented: $presentFilterSheet) {
                            FilterView(allergy: $allergy, isGlutenFree: $isGlutenFree, dietType: $dietType, presentFilterSheet: $presentFilterSheet)
                                .interactiveDismissDisabled()
                        }
                       
                    }
                }
                .buttonStyle(.automatic)
                Spacer()
            }
        }
    }
}

#Preview {
    PreferenceView()
        .previewDisplayName("Light Mode")
}

struct ContactsViewList_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDisplayName("Light Mode")
        ContentView()
            .preferredColorScheme(.dark)
            .previewDisplayName("Dark Mode")
        ContentView()
            .environment(\._colorSchemeContrast, .increased)
            .previewDisplayName("Light Mode High Contrast")
        ContentView()
            .preferredColorScheme(.dark)
            .environment(\._colorSchemeContrast, .increased)
            .previewDisplayName("Dark Mode High Contrast")
        ContentView()
            .environment(\.sizeCategory, .accessibilityExtraExtraExtraLarge)
            .previewDisplayName("Dynamic Type: Font Size Extra Extra Extra Large")
        ContentView()
            .environment(\._accessibilityReduceMotion, true)
            .previewDisplayName("Reduce Motion")
        ContentView()
            .environment(\._accessibilityShowButtonShapes, true)
            .previewDisplayName("Button Shapes")
    }
}
