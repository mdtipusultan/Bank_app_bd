//
//  Bank_appApp.swift
//  Bank_app
//
//  Created by Finjet on 29/7/24.
//

//import SwiftUI

//@main
//struct Bank_appApp: App {
//    
//    init() {
//           
//           UINavigationBar.appearance().backgroundColor = UIColor(red: 0.00, green: 0.30, blue: 0.56, alpha: 1.00)
//        //UIColor(red: 0.592156862745098, green: 0.5490196078431373, blue: 0.12941176470588237, alpha: 1.0)
//        
//        
//           UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.white]
//           UIBarButtonItem.appearance().tintColor = .white
//           
//       }
//    var body: some Scene {
//        WindowGroup {
//            LoginView()
//        }
//    }
//}


import SwiftUI

@main
struct Bank_appApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .edgesIgnoringSafeArea(.all)
                .background(Color.green) // Set your desired color here
                .onAppear {
                    setupAppearance()
                }
        }
    }
    
    func setupAppearance() {
        let coloredAppearance = UINavigationBarAppearance()
        coloredAppearance.configureWithOpaqueBackground()
        coloredAppearance.backgroundColor =  UIColor(Color("ThemeColor"))
        UINavigationBar.appearance().standardAppearance = coloredAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = coloredAppearance
        
        if let statusBarFrame = UIApplication.shared.windows.first?.windowScene?.statusBarManager?.statusBarFrame {
            let statusBarView = UIView(frame: statusBarFrame)
            statusBarView.backgroundColor = UIColor(Color("ThemeColor"))
            UIApplication.shared.windows.first?.addSubview(statusBarView)
        }
    }
}

struct ContentView: View {
    var body: some View {
        NavigationView {
            LoginView()
                //.navigationBarHidden(true) // Hide the navigation bar
        }
    }
}
