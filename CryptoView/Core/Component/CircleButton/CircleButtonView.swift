//
//  CircleButtonView.swift
//  CryptoView
//
//  Created by Sepehr on 20/12/2023.
//

import SwiftUI

struct CircleButtonView: View {
    let iconName : String
    var body: some View {
        Image(systemName: iconName)
            .font(.headline)
            .foregroundStyle(Color.theme.accent)
            .frame(width: 50,height: 50)
            .background(
            Circle()
                .foregroundStyle(Color.theme.background)
            )
        
            .shadow(radius: 10)
            .padding()
    }
}

#Preview {
    Group{
        CircleButtonView(iconName: Constants.leftArrowIcon)
        
    }    .previewLayout(.sizeThatFits)
 
}
