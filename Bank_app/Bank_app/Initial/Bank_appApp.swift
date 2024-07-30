//
//  Bank_appApp.swift
//  Bank_app
//
//  Created by Finjet on 29/7/24.
//

import SwiftUI

@main
struct Bank_appApp: App {
    
    init() {
           
           UINavigationBar.appearance().backgroundColor = UIColor(red: 0.592156862745098, green: 0.5490196078431373, blue: 0.12941176470588237, alpha: 1.0)
           UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.white]
           UIBarButtonItem.appearance().tintColor = .white
           
       }
    var body: some Scene {
        WindowGroup {
            LoginView()
        }
    }
}
