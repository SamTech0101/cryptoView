//
//  CoinImageDataService.swift
//  CryptoView
//
//  Created by Sepehr on 26/12/2023.
//

import Combine
import UIKit
class CoinImageDataService{
    @Published var image : UIImage?
    private var subcribtion : AnyCancellable?
    var coinModel : CoinModel
    init(coinModel : CoinModel) {
        self.coinModel = coinModel
    }
    
    
    private func futchImage(){
        guard let url = URL(string: coinModel.image) else {return}
        subcribtion = NetworkManager.fetchData(url: url)
            .tryMap({data -> UIImage? in
                return UIImage(data: data)
            }
            ).sink(receiveCompletion: NetworkManager.handleCompletion, receiveValue: {[weak self]
                image in
                self?.image = image
                self?.subcribtion?.cancel()
            })
    }
    
    
}
