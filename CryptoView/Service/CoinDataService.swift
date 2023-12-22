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
    var coinSubscriptions: AnyCancellable?
    
    
    func fetchCoins() {
        guard let url = URL(string: Constants.fetchCoinsURL) else { return}
       coinSubscriptions = URLSession.shared.dataTaskPublisher(for: url)
            .subscribe(on: DispatchQueue.global(qos: .default))
            .tryMap{ output -> Data in
                guard let response = output.response as? HTTPURLResponse,
                      response.statusCode >= 200 && response.statusCode < 300
                else {
                    throw URLError(.badServerResponse)
                }
                return output.data
                
            }
            .decode(type: [CoinModel].self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: {(completion) in
                  switch completion {
            
                  case .finished:
                      break
                  case .failure(let error):
                      debugPrint("CoinDataService --> fetchCoins --> \(error.localizedDescription)")
                  }}
                  , receiveValue: { [weak self] coins in
                self?.allCoins.append(contentsOf: coins)
                self?.coinSubscriptions?.cancel()
            })
    }
    
    
}
