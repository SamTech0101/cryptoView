//
//  CoinRowView.swift
//  CryptoView
//
//  Created by Sepehr on 22/12/2023.
//

import SwiftUI

struct CoinRowView: View {
    let coin:CoinModel
    let showHoldignColumn : Bool
    var body: some View {
        HStack(spacing: 0) {
          leftView
            Spacer()
            if showHoldignColumn {
                centerView
            }
            rightView
            
        }.font(.subheadline)
    }
}

#Preview {
    CoinRowView(coin: DeveloperPreview.instance.coin, showHoldignColumn: true)
}
extension CoinRowView{
    func getColorPriceChange(amount : Double) -> Color{
        amount >= 0 ? Color.theme.green : Color.theme.red
    }
    private  var leftView : some View {
        HStack(spacing:0){
            Text("\(coin.rank)")
                .font(.caption)
                .foregroundStyle(Color.theme.secondaryText)
                .frame(minWidth: Constants.size30)
            CoinImageView(coinModel: coin)
                .frame(width: Constants.size30, height: Constants.size30)
            
            Text(coin.symbol.uppercased())
                .font(.headline)
                .foregroundStyle(Color.theme.accent)
                .padding(.leading,Constants.padding8)
        }
    }
    private var centerView : some View {
        VStack(alignment: .trailing){
            Text(coin.currentHoldingsValue.asCurrencyWith6Decimals())
                .bold()
            Text((coin.currentHoldings ?? 0).asNumberString())
        }.foregroundColor(Color.theme.accent)
    }
    private var rightView : some View {
        VStack(alignment: .trailing)  {
            Text(coin.currentPrice.asCurrencyWith6Decimals())
                .bold()
                .foregroundStyle(Color.theme.accent)
            Text(coin.priceChangePercentage24H.asPercentString())
                .foregroundStyle(getColorPriceChange(amount: coin.priceChangePercentage24H))
            
        }.frame(width: UIScreen.main.bounds.size.width/3.5,alignment: .trailing)
    }
    
}
