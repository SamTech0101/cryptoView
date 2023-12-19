//
//  HomeView.swift
//  CryptoView
//
//  Created by Sepehr on 20/12/2023.
//

import SwiftUI

struct HomeView: View {
    @State private  var  showPortfolio : Bool = false
    var body: some View {
        ZStack{
            Color.theme.background
                .ignoresSafeArea()
            VStack{
                homeHeader
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

}
extension HomeView{
    var homeHeader : some View {
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
}
