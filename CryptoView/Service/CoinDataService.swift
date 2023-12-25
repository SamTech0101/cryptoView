//
//  CoinDataService.swift
//  CryptoView
//
//  Created by Sepehr on 23/12/2023.
//

import Foundation
import Combine
protocol CoinDataServiceProtocol{
    func fetchCoins()
}
class CoinDataService : CoinDataServiceProtocol {
    @Published var allCoins : [CoinModel] = []
   private var coinSubscriptions: AnyCancellable?
    
    init() {
        fetchCoins()
    }
    
    func fetchCoins() {
        guard let url = URL(string: Constants.fetchCoinsURL) else { return}
        coinSubscriptions = NetworkManager.fetchData(url: url)
            .decode(type: [CoinModel].self, decoder: JSONDecoder())
            .sink(receiveCompletion: NetworkManager.handleCompletion
                  , receiveValue: { [weak self] coins in
                self?.allCoins.append(contentsOf: coins)
                self?.coinSubscriptions?.cancel()
            })
    }
    
    
}
