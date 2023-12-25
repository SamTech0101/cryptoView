//
//  HomeViewModel.swift
//  CryptoView
//
//  Created by Sepehr on 23/12/2023.
//

import Foundation
import Combine
class HomeViewModel : ObservableObject,CoinDataServiceProtocol{
    private let coinDataService : CoinDataService = CoinDataService()
    
    @Published var allCoins : Array<CoinModel> = []
    @Published var portfolioCoins : Array<CoinModel> = []
    private var cancelable = Set<AnyCancellable>()
    
    init() {
     fetchCoins()
    }
    
    func fetchCoins() {
    
        coinDataService.$allCoins.sink{[weak self]
            coins in
            self?.allCoins = coins
        }.store(in: &cancelable)
    }
}
