//
//  BaseHome.swift
//  Bank_app
//
//  Created by Finjet on 30/7/24.
//

import SwiftUI

struct BaseHome: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    //Image(systemName: "house.fill")
                    Image(uiImage: UIImage(named: "home")!)
                }
            
            TransferHistoryView()
                .tabItem {
                    //Image(systemName: "2.circle")
                    Image(uiImage: UIImage(named: "transfer_history")!)
                }
            
            NavigationView {
                QRCashView()
            }
            .tabItem {
                //Image(systemName: "4.circle")
                Image(uiImage: UIImage(named: "qrcash")!)
            }
            
            TransferLimitView()
                .tabItem {
                    Image(uiImage: UIImage(named: "transfer_limit")!)
                }
            
            
            NavigationView {
                SettingsView()
            }
            .tabItem {
                //Image(systemName: "4.circle")
                Image(uiImage: UIImage(named: "settings")!)
            }
            
        }
        //tabbar image color
        //.accentColor(appColor)
        //.topSafeAreaColor()
    }
}

#Preview {
    BaseHome()
}
