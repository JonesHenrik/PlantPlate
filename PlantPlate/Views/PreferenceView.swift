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
    @State private var title: DishStyle = .dinner
    @State private var value = 1
    @State private var ingredient = ""
    @State private var presentSheet = false
    @State private var presentFilterSheet = false
    @State private var showIngredientAlert = false
    @StateObject private var viewModel = ChatViewModel()
    
    // Mutable Variable on Filter Screen
    @State public var allergy = ""
    @State public var isGlutenFree = false
    @State public var dietType: DietType = .none
    
    // Haptic Feedback
    @State private var alertHaptic = false
    
    // Keyboard Dismiss
    @FocusState private var isFocused: Bool

    var body: some View {
        NavigationStack {
            ZStack {
                Color.background.ignoresSafeArea()
                VStack {
                    TitleView(text: "Cooking Today?")
                        .dynamicTypeSize(...DynamicTypeSize.xxxLarge)
                        .padding()

                    PickerView()
                    //.background(RoundedRectangle(cornerRadius: 15).fill(Color.gray.opacity(0.1)))
                        .padding(.horizontal)
                    // VoiceOver can be found in PickerView
                    StepperView(value: $value)
                        .padding(.horizontal)
                        .accessibilityLabel(Text("Serving size adjustment"))
                        .accessibilityHint(Text("Changes the serving size of the recipe."))
                        ZStack(alignment: .trailing) {
                            TextField("Add Ingredients", text: $ingredient)
                                .focused($isFocused)
                                .padding()
                                .background(
                                    RoundedRectangle(cornerRadius: 15)
                                        .fill(Color.gray.opacity(0.1)))
                                .padding()
                                .accessibilityLabel(Text("Add Ingrediants"))
                                .accessibilityHint(Text("Enter the ingredients you currently possess to generate a recipe."))
                            Button("Done") {
                                isFocused = false
                            }
                            .padding(.trailing, 30)
                            .foregroundStyle(Color("secondaryButton"))
                            .accessibilityLabel(Text("Done"))
                            .accessibilityLabel(Text("Press when finished entering your ingredients. Will close your keyboard."))
                        }
                    Spacer()
                    Button(action: {
                        if ingredient.isEmpty {
                            showIngredientAlert = true
                            alertHaptic = true
                        } else {
                            presentSheet.toggle()
                            viewModel.sendChatGPTRequest(prompt: masterPrompt + ingredient + dishStyleSelection(dishStyle) + timeSelection(selectedTime) + allergens(allergy) + glutenFree(isGlutenFree) + diet(dietType) + serving(value), apiKey: Secrets.apiKey)
                            print(ingredient)
                            UIImpactFeedbackGenerator(style: .light).impactOccurred()
                        }
                    }, label: {
                        ButtonView(text: "Generate Recipe")
                    })
                    .buttonStyle(.automatic)
                    .accessibility(label: Text("Generate Recipe Button"))
                    .accessibility(hint: Text("Tap to generate your vegan recipe based on your inputs."))
                    .accessibility(addTraits: .isButton)
                    .alert(isPresented: $showIngredientAlert) {
                        Alert(
                            title: Text("Error"),
                            message: Text("Please enter an ingredient"),
                            dismissButton: .default(Text("OK"))
                        )
                    }
                    .sensoryFeedback(.warning, trigger: alertHaptic)
                    .sheet(
                        isPresented: $presentSheet,
                        content: {
                            RecipeView(presentSheet: $presentSheet, selectedTime: $selectedTime, dishStyle: $dishStyle, title: $title, value: $value, ingredient: $ingredient, recipeBody: $viewModel.generatedText)
                                .interactiveDismissDisabled()
                        })
                    .buttonStyle(.automatic)
                    .accessibility(label: Text("Generate Recipe Button"))
                    .accessibility(hint: Text("Tap to generate your vegan recipe based on your inputs."))
                    .accessibility(addTraits: .isButton)
                    .alert(isPresented: $showIngredientAlert) {
                        Alert(
                            title: Text("Error"),
                            message: Text("Please enter an ingredient"),
                            dismissButton: .default(Text("OK"))
                        )
                    }
                    //.navigationTitle("Plant Plate")
                    // .accessibilityLabel(Text("Main Screen Title"))
                    .toolbar {
                        ToolbarItem(placement: .topBarTrailing) {
                            Button(action: {
                                presentFilterSheet.toggle()
                                UIImpactFeedbackGenerator(style: .light).impactOccurred()
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
                    .accessibility(label: Text("Filter/Preferences Button"))
                    .accessibility(hint: Text("Tap to change your preferences. This will include whether you are gluten free, follow a specific vegan diet, or have any allergies/other dietary restrictions."))
                    .accessibility(addTraits: .isButton)
                    Spacer()
                }
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
