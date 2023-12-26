//
//  CoinImageView.swift
//  CryptoView
//
//  Created by Sepehr on 26/12/2023.
//

import SwiftUI

struct CoinImageView: View {
    @StateObject private var coinImageVm : CoinImageViewModel
    init(coinModel : CoinModel) {
        _coinImageVm = StateObject(wrappedValue: CoinImageViewModel(coinModel: coinModel))
    }
    
    var body: some View {
        if let image = coinImageVm.coinImage {
            Image(uiImage: image)
                .resizable()
                .scaledToFit()
        }else if coinImageVm.isLoading{
            ProgressView()
        }else{
            Image(systemName: Constants.questionMarkIcon)
        }
        
    }
}

#Preview {
    CoinImageView(coinModel: DeveloperPreview.instance.coin)
}
