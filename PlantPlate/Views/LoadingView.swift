//
//  LoadingView.swift
//  PlantPlate
//
//  Created by Henrik Jones on 2/7/24.
//

import SwiftUI

struct LoadingView: View {
    @State var scale = 1.0
    @State var isAnimating = false
    
    var animation: Animation {
        Animation.linear(duration: 3.0)
            .repeatForever(autoreverses: false)
    }
    
    var body: some View {
        
        ZStack{
              Color.background.ignoresSafeArea()
            VStack {
                Image("tomato")
                    .scaledToFit()
                    .imageScale(.small)
                    .scaleEffect(scale)
                
                //animation for veggie asset
                    .rotationEffect(Angle(degrees: self.isAnimating ? 360 : 0.0))
                //calling animation
                    .onAppear {
                        withAnimation(animation) {
                            self.isAnimating = true
                        }
                    }
                    .onDisappear { self.isAnimating = false }
                
                
                HStack {
                    Text("Loading...")
                        .font(.custom("Magica", size: 32))
                        .foregroundStyle(Color("titleColor"))
                        .scaleEffect(scale)
                        .accessibilityLabel(Text("Loading"))
                        .accessibilityHint(Text("Your recipe is being generated"))
                    
                    //calling animation
                        .onAppear {
                            withAnimation(animation) {
                                self.isAnimating = true
                            }
                        }
                        .onDisappear { self.isAnimating = false }
                }
                
            }
            .padding()
        }
    }
    
}







#Preview {
    LoadingView()
}

