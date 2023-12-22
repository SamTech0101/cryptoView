//
//  HomeViewModel.swift
//  CryptoView
//
//  Created by Sepehr on 23/12/2023.
//

import Foundation

class HomeViewModel : ObservableObject{
    @Published var allCoins : Array<CoinModel> = []
    @Published var portfolioCoins : Array<CoinModel> = []
    
    init() {
        DispatchQueue.main.asyncAfter(deadline: .now()  + 3){ [self] in
            allCoins.append(DeveloperPreview.instance.coin)
            portfolioCoins.append(DeveloperPreview.instance.coin)
        }
    }
}
