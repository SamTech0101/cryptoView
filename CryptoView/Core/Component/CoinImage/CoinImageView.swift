//
//  CoinImageView.swift
//  CryptoView
//
//  Created by Sepehr on 26/12/2023.
//

import SwiftUI

struct CoinImageView: View {
    @StateObject private var coinImageVm : CoinImageViewModel = CoinImageViewModel()
    var body: some View {
        if let image = coinImageVm.coinImage {
            Image(uiImage: image)
        }else if coinImageVm.isLoading{
            ProgressView()
        }else{
            Image(systemName: Constants.questionMarkIcon)
        }
        
    }
}

#Preview {
    CoinImageView()
}
