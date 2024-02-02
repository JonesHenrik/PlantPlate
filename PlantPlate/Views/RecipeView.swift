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
        
            HStack {
                Text(recipeTitle(title))
                    .font(.title)
                    .bold()
                Spacer()
//                Button(action: {
//                    
//                }, label: {
//                    Image(systemName: "speaker.wave.2.fill")
//                        .foregroundStyle(Color("ButtonColor"))
//                        .font(.largeTitle)
//                })
//                .accessibilityLabel(Text("Hands-free Button"))
//                .accessibilityHint(Text("This will read out the recipe to the user so that they can go hands free or if they are preoccupied with another task."))
//                .accessibilityAddTraits(.isButton)
                
            }
            .padding()
            Divider()
                .padding(.horizontal)
            ScrollView {
                Text(recipeBody)
                if recipeBody.isEmpty {
                    ProgressView()
                }
            }
                .padding()
            Button(action: {
                presentSheet.toggle()
                ingredient = ""
                value = 1
                selectedTime = .supriseMe
                dishStyle = .breakfast
            }, label: {
                ButtonView(text: "Complete")
            })
            .accessibilityLabel(Text("Completed Button"))
            .accessibilityHint(Text("This will allow you to exit the recipe and return you to the generation screen when done."))
            .accessibilityAddTraits(.isButton)
        }
    }


#Preview {
    RecipeView(presentSheet: .constant(false), selectedTime: .constant(.supriseMe), dishStyle: .constant(.breakfast), title: .constant(.dinner), value: .constant(1), ingredient: .constant("Lettuce"), recipeBody: .constant("Yes Chef, Here is your Recipe"))
}

