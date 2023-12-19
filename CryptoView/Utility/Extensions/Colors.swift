//
//  Colors.swift
//  CryptoView
//
//  Created by Sepehr on 19/12/2023.
//

import SwiftUI

extension Color {
    static let theme = ColorTheme()
}

struct ColorTheme{
    let accent = Color(Constants.accent)
    let background = Color(Constants.background)
    let green = Color(Constants.green)
    let red = Color(Constants.red)
    let secondaryText = Color(Constants.secondaryText)
}
