//
//  HomeView.swift
//  CryptoView
//
//  Created by Sepehr on 20/12/2023.
//

import SwiftUI

struct HomeView: View {
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
            Button("plus", action: {})
            Spacer()
            Text("Prices")
            Spacer()
            Button("plus", action: {})
        }.padding(.horizontal)
    }
}
