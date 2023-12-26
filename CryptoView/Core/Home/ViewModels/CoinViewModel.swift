//
//  CoinViewModel.swift
//  CryptoView
//
//  Created by Sepehr on 26/12/2023.
//

import Foundation
import UIKit
class CoinImageViewModel : ObservableObject{
    @Published var coinImage : UIImage? = nil
    @Published var isLoading : Bool = false
    
    
    init() {
        fetchCoinImage()
    }
    func fetchCoinImage(){
        
    }
    
    
}
