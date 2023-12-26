//
//  CoinViewModel.swift
//  CryptoView
//
//  Created by Sepehr on 26/12/2023.
//

import Foundation
import UIKit
import Combine
class CoinImageViewModel : ObservableObject{
    @Published var coinImage : UIImage? = nil
    @Published var isLoading : Bool = false
    private var coinImageService : CoinImageDataService
    let coinModel : CoinModel
    private var subscribtion = Set<AnyCancellable>()
    
    
    init(coinModel : CoinModel) {
        self.coinModel = coinModel
        self.coinImageService = CoinImageDataService(coinModel: coinModel)
        self.isLoading = true
        fetchCoinImage()
    }
    func fetchCoinImage(){
        coinImageService.$image.sink(receiveCompletion: {
           [weak self] _ in
            self?.isLoading = false
        }, receiveValue: {
           [weak self] uiImage in
            self?.coinImage = uiImage
        }).store(in: &subscribtion)
    }
    
    
}
