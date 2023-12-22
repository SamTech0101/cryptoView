//
//  CryptoViewApp.swift
//  CryptoView
//
//  Created by Sepehr on 19/12/2023.
//

import SwiftUI

@main
struct CryptoViewApp: App {
    @StateObject var homeVm : HomeViewModel = HomeViewModel()
    var body: some Scene {
        WindowGroup {
            NavigationView{
                HomeView()
                    .toolbar(Visibility.hidden)
            }
            .environmentObject(homeVm)
    
        }
    }
}
