//
//  SecondScreen.swift
//  Bank_app
//
//  Created by Finjet on 6/8/24.
//

import SwiftUI

struct SecondScreen: View {
    @Binding var currentPage: Int
    
    var body: some View {
        VStack {
            //Spacer()
            Image("second_page")
                //.resizable()
                //.frame(width: 200, height: 200)
            Text("Saving Your Money")
                .font(.system(size: 35))
                .bold()
                .multilineTextAlignment(.center)
            
            Text("Track the progress of your savings and start a habit of saving with MasterPay.")
                .font(.footnote)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
                .padding(.top, 1)
            Spacer()
        }
        .padding()
    }
}

#Preview {
    SecondScreen(currentPage: .constant(1))
}
