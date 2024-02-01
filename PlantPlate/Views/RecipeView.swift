//
//  RecipeView.swift
//  PlantPlate
//
//  Created by Henrik Jones on 2/1/24.
//

import SwiftUI

struct RecipeView: View {
    @StateObject private var viewModel = ChatViewModel()
    
    var body: some View {
        ScrollView {
            HStack {
                Text("Your Meal")
                    .font(.largeTitle)
                Spacer()
                Image(systemName: "speaker.wave.2.fill")
                    .foregroundStyle(Color.purple)
                    .font(.largeTitle)
            }
            .padding()
            Divider()
                .padding(.horizontal)
            Text("\(viewModel.generatedText)")
                .padding()
        }
    }
}

#Preview {
    RecipeView()
}

