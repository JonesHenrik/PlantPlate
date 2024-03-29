//
//  RecipeView.swift
//  PlantPlate
//
//  Created by Henrik Jones on 2/1/24.
//

import SwiftUI

struct RecipeView: View {
    @StateObject private var viewModel = ChatViewModel()
    @Binding var presentSheet: Bool
    @Binding var selectedTime: Time
    @Binding var dishStyle: DishStyle
    @Binding var title: DishStyle
    @Binding var value: Int
    @Binding var ingredient: String
    
    @Binding var recipeBody: String
    
    var body: some View {
        if recipeBody.isEmpty {
            LoadingView()
        } else {
            ZStack {
                Color.background.ignoresSafeArea()
                VStack {
                    HStack {
                        Text("Your Plant Plate")
                            .font(.custom("Magica", size: 18, relativeTo: .title))
                            .bold()
                            .foregroundStyle(Color("titleColor"))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                    }
                    .padding()
                    Spacer()
                    Divider()
                        .padding(.horizontal)
                    ScrollView {
                        Text(recipeBody)
                    }
                    .padding()
                    Button(action: {
                        presentSheet.toggle()
                        ingredient = ""
                        value = 1
                        recipeBody = ""
                        UIImpactFeedbackGenerator(style: .light).impactOccurred()
                    }, label: {
                        ButtonView(text: "Complete")
                    })
                    .buttonStyle(.automatic)
                    .accessibilityLabel(Text("Completed Button"))
                    .accessibilityHint(Text("This will allow you to exit the recipe and return you to the generation screen when done."))
                    .accessibilityAddTraits(.isButton)
                }
            }
        }
    }
}


#Preview {
    RecipeView(presentSheet: .constant(false), selectedTime: .constant(.supriseMe), dishStyle: .constant(.breakfast), title: .constant(.dinner), value: .constant(1), ingredient: .constant("Lettuce"), recipeBody: .constant("Yes Chef, Here is your Recipe"))
}

