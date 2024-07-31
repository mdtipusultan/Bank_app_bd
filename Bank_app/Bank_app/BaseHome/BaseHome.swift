//
//  BaseHome.swift
//  Bank_app
//
//  Created by Finjet on 30/7/24.
//
//
//import SwiftUI
//
//struct BaseHome: View {
//    var body: some View {
//        TabView {
//            HomeView()
//                .tabItem {
//                    //Image(systemName: "house.fill")
//                    Image(uiImage: UIImage(named: "home")!)
//                }
//
//            TransferHistoryView()
//                .tabItem {
//                    //Image(systemName: "2.circle")
//                    Image(uiImage: UIImage(named: "transfer_history")!)
//                }
//
//            NavigationView {
//                QRCashView()
//            }
//            .tabItem {
//                //Image(systemName: "4.circle")
//                Image(uiImage: UIImage(named: "qrcash")!)
//            }
//
//            TransferLimitView()
//                .tabItem {
//                    Image(uiImage: UIImage(named: "transfer_limit")!)
//                }
//
//
//            NavigationView {
//                SettingsView()
//            }
//            .tabItem {
//                //Image(systemName: "4.circle")
//                Image(uiImage: UIImage(named: "settings")!)
//            }
//
//        }
//        //tabbar image color
//        //.accentColor(appColor)
//        //.topSafeAreaColor()
//    }
//}
//
//#Preview {
//    BaseHome()
//}




import SwiftUI

struct BaseHome: View {
    @State private var selectedTab = 0
    
    var body: some View {
        VStack {
            Spacer()
            
            switch selectedTab {
            case 0:
                HomeView()
            case 1:
                TransferHistoryView()
            case 2:
                QRCashView()
            case 3:
                TransferLimitView()
            case 4:
                SettingsView()
            default:
                HomeView()
            }
            
            Spacer()
            
            CustomTabBar(selectedTab: $selectedTab)
        }
    }
}

struct CustomTabBar: View {
    @Binding var selectedTab: Int
    
    var body: some View {
        HStack {
            TabBarButton(imageName: "home", title: "Home", isSelected: selectedTab == 0) {
                selectedTab = 0
            }
            Spacer()
            TabBarButton(imageName: "transfer_history", title: "Transfer History", isSelected: selectedTab == 1) {
                selectedTab = 1
            }
            Spacer()
            TabBarButton(imageName: "qrcash", title: "", isSelected: selectedTab == 2) {
                selectedTab = 2
            }
            Spacer()
            TabBarButton(imageName: "transfer_limit", title: "Transfer Limit", isSelected: selectedTab == 3) {
                selectedTab = 3
            }
            Spacer()
            TabBarButton(imageName: "settings", title: "Settings", isSelected: selectedTab == 4) {
                selectedTab = 4
            }
        }
        .padding(.leading)
        .padding(.trailing)
        .frame(height: 68)
        .background(Color.gray.opacity(0.5))
    }
}

struct TabBarButton: View {
    let imageName: String
    let title: String
    let isSelected: Bool
    let action: () -> Void
    
    var body: some View {
        VStack {
            
            if title == "" {
                // for not changing the icon color for QR Cash
                Image(uiImage: UIImage(named: imageName)!)
            } else {
                // Change the icon color for other tabs
                Image(uiImage: UIImage(named: imageName)!)
                    .renderingMode(.template)
                    .foregroundColor(isSelected ? Color("AccentColor") : .gray)
            }
            Text(title)
                .font(.caption2)
                .foregroundColor(isSelected ? Color("AccentColor") : .gray)
                
        }
        //.padding()
        .onTapGesture {
            action()
        }
    }
}


#Preview {
    BaseHome()
}
