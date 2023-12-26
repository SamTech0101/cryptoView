//
//  CircleButtonAnimation.swift
//  CryptoView
//
//  Created by Sepehr on 20/12/2023.
//

import SwiftUI

struct CircleButtonAnimation: View {
    @Binding var animate : Bool
    var body: some View {
            Circle()
            .stroke(lineWidth: 5)
            .scale( animate ? 1 : 0 )
            .opacity(animate ? 0 : 1)
            .animation(animate ? .easeOut(duration: 1) : .none, value: animate)
           
    }
}

#Preview {
    CircleButtonAnimation(animate: .constant(false))
}
