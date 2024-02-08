//
//  TitleView.swift
//  PlantPlate
//
//  Created by Henrik Jones on 2/8/24.
//

import SwiftUI

struct TitleView: View {
    var text: String
    
    var body: some View {
        Text(text)
            .font(.custom("Magica", size: 30, relativeTo: .title))
            .foregroundStyle(Color("titleColor"))
            .frame(maxWidth: .infinity, alignment: .leading)
    }
}

#Preview {
    TitleView(text: "Cooking Today?")
}
