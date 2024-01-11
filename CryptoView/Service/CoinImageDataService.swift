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
    private var coinModel : CoinModel
    private let fileManager = LocalManager.instance
    init(coinModel : CoinModel) {
        self.coinModel = coinModel
        fetchCoinImages()
    }
    
    private func fetchCoinImages(){
        if let savedImage = fileManager.getImage(folderName: Constants.folderName, imageName: coinModel.id) {
            self.image = savedImage
            debugPrint("Fetch image from File manager")
        }else {
            downloadCoinImage()
            debugPrint("Fetch image from Internet")
        }
    }
    
    
    private func downloadCoinImage(){
        guard let url = URL(string: coinModel.image) else {return}
        subcribtion = NetworkManager.fetchData(url: url)
            .tryMap({data -> UIImage? in
                return UIImage(data: data)
            }
            ).sink(receiveCompletion: NetworkManager.handleCompletion, receiveValue: {[weak self]
                image in
                guard let self = self , let downloadedImage = image else {return}
                self.image = downloadedImage
                self.fileManager.saveImage(uiImage: downloadedImage, imageName: coinModel.id, folderName: Constants.folderName)
                self.subcribtion?.cancel()
            })
    }
    
    
}
