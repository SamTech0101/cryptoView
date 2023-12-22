//
//  HomeView.swift
//  CryptoView
//
//  Created by Sepehr on 20/12/2023.
//

import SwiftUI

struct HomeView: View {
    @State private  var  showPortfolio : Bool = false
    @EnvironmentObject  private var homeVm : HomeViewModel
    var body: some View {
        ZStack{
            Color.theme.background
                .ignoresSafeArea()
            VStack{
                homeHeader
                
                subHeader
                if showPortfolio{
                    portfolioCoins
                        .transition(.move(edge: .leading))
                }else{
                    allCoins
                        .transition(.move(edge: .trailing))
                }
                
               
                Spacer(minLength: 0)
            }
            
        }
    }
}

#Preview {
    NavigationView{
        HomeView()
            .toolbar(Visibility.hidden)

    }
    .environmentObject(DeveloperPreview.instance.homeVm)

}
extension HomeView{
   private var homeHeader : some View {
        return HStack{
            CircleButtonView(iconName: showPortfolio ? Constants.plusIcon : Constants.infoIcon)
                .animation(.none,value: showPortfolio)
                .background(
                CircleButtonAnimation(animate: $showPortfolio))
            Spacer()
            Text(showPortfolio ? Constants.portfolioTitle : Constants.LivePricesTitle)
                .font(.headline)
                .fontWeight(.heavy)
                .foregroundStyle(Color.theme.accent)
                .animation(.none,value: showPortfolio)
            Spacer()
            CircleButtonView(iconName: Constants.rightArrowIcon)
                .rotationEffect(Angle(degrees: showPortfolio ? 180 : 0))
                .onTapGesture {
                    withAnimation(.spring()){
                        showPortfolio.toggle()
                    }
                   
                }
                
        }.padding(.horizontal)
    }
    private var allCoins : some View {
        List{
            ForEach(homeVm.allCoins){coin in
                CoinRowView(coin: coin, showHoldignColumn: showPortfolio)
                    .listRowInsets(.init(top: Constants.padding10, leading: 0, bottom: Constants.padding10, trailing: 10))
                
            }
        }.listStyle(.plain)
        
    }
    private var portfolioCoins : some View {
        List{
            ForEach(homeVm.portfolioCoins){coin in
                CoinRowView(coin: coin, showHoldignColumn: showPortfolio)
                    .listRowInsets(.init(top: Constants.padding10, leading: 0, bottom: Constants.padding10, trailing: 10))
                
            }
        }.listStyle(.plain)
        
    }
    
    private var subHeader : some View {
        HStack{
            Text(Constants.coinTitle)
            Spacer()
            if showPortfolio{
                Text(Constants.holdingTitle)
            }
            
            Text(Constants.priceTitle)
                .frame(width: UIScreen.main.bounds.size.width/3.5,alignment: .trailing)
        }.font(.caption)
            .foregroundStyle(Color.theme.secondaryText)
            .padding(.horizontal)
    }
}
