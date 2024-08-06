//
//  SignUPView.swift
//  Bank_app
//
//  Created by Finjet on 1/8/24.
//

import SwiftUI

struct SignUPView: View {
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .navigationTitle("Sign Up")
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading: backButton)
    }
    
    private var backButton: some View {
        Button(action: {
            presentationMode.wrappedValue.dismiss()
            print("Back button pressed")
        }) {
            HStack {
                Image(systemName: "chevron.left")
                    .foregroundColor(.blue) // Customize the color
                Text("")
                    .foregroundColor(.clear) // Hide the text
            }
        }
    }
    
}

#Preview {
    SignUPView()
}
