//
//  Constants.swift
//  CryptoView
//
//  Created by Sepehr on 19/12/2023.
//

import Foundation

struct Constants {
    //Colors
static let accent = "AccentColor"
static let background = "BackgroundColor"
static let green = "GreenColor"
static let red = "RedColor"
static let secondaryText = "SecondaryTextColor"
    
    //Icons
    static let plusIcon = "plus"
    static let infoIcon = "info"
    static let rightArrowIcon = "chevron.right"
    static let leftArrowIcon = "chevron.left"
    static let questionMarkIcon = "questionmark"
    
    //String

    static let portfolioTitle = "Portfolio"
    static let LivePricesTitle = "Live Prices"
    static let coinTitle = "Coins"
    static let holdingTitle = "Holdings"
    static let priceTitle = "Price"
    static let folderName = "coin_images"
    
    // CGFloat
    static let padding4:CGFloat = 4
    static let padding8:CGFloat = 8
    static let padding10:CGFloat = 10
    static let padding12:CGFloat = 12
    static let padding14:CGFloat = 14
    
    static let size30:CGFloat = 30
    
    // URL
    static let fetchCoinsURL : String = "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=250&page=1&sparkline=true&price_change_percentage=24h"



}
