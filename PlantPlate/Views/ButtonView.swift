//
//  ButtonView.swift
//  PlantPlate
//
//  Created by Henrik Jones on 2/1/24.
//

import SwiftUI

struct ButtonView: View {
    var text: String
    
    // Main Button
    var body: some View {
        Text(text)
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .background(LinearGradient(
                            gradient: Gradient(
                                colors: [
                                    Color("ButtonColor"),
                                    Color("ButtonColor")
                                ]),
                            startPoint: .leading,
                            endPoint: .trailing
                        ))
                        .cornerRadius(15)
                        .padding(.horizontal, 20)
    }
}

struct SaveButtonView: View {
    var text: String
    
    // Save Button
    var body: some View {
        Text(text)
                        .font(.title)
                        .foregroundColor(.white)
                        .padding()
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 100)
                        .background(LinearGradient(
                            gradient: Gradient(
                                colors: [
                                    Color("ButtonColor"),
                                    Color("ButtonColor")
                                ]),
                            startPoint: .leading,
                            endPoint: .trailing
                        ))
                        .cornerRadius(15)
                        .padding(.horizontal, 20)
    }
}

struct FilterButtonView: View {
    var body: some View {
        Image(systemName: "slider.horizontal.3")
            .imageScale(.large)
            .foregroundStyle(Color("ButtonColor"))
    }
}

#Preview {
    ButtonView(text: "Generate Recipe")
}

#Preview {
    SaveButtonView(text: "Save")
}
