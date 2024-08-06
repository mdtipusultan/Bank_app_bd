//
//  ThirdScreen.swift
//  Bank_app
//
//  Created by Finjet on 6/8/24.
//

import SwiftUI

struct ThirdScreen: View {
    @Binding var currentPage: Int
    
    var body: some View {
        VStack {
            //Spacer()
            Image("third_page")
                //.resizable()
                //.frame(width: 200, height: 200)
            Text("Bills Payment Made Easy")
                .font(.system(size: 35))
                .bold()
                .multilineTextAlignment(.center)
            
            Text("Pay monthly or daily bills at home in a site of MasterPay.")
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
    ThirdScreen(currentPage: .constant(2))
}
