//
//  TransferHistoryView.swift
//  Bank_app
//
//  Created by Finjet on 30/7/24.
//

import SwiftUI

struct TransferHistoryView: View {
    var body: some View {
        ZStack {
            Color.red
                .edgesIgnoringSafeArea(.top) // Only the top safe area will be red
                (Color.white) // Main background color
            VStack {
                
                Text("transfer")
                    .padding()
                // Your other view content
            }
            
        }
        
    }
}

#Preview {
    TransferHistoryView()
}
