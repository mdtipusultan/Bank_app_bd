//
//  inputField.swift
//  Bank_app
//
//  29/7/24.
//


import SwiftUI

struct inputField: View {
    @Binding var text: String
    let title: String
    let placeHolder: String
    var isSecureField = false
    
    var body: some View {
        
       
            
        VStack(alignment: .trailing,spacing: 12){
                            
            if isSecureField{
                SecureField(placeHolder, text: $text)
                    .font(.system(size: 14))
            }
            else{
                TextField(placeHolder, text: $text)
                    .font(.system(size: 14))
            }
            Divider()
            
            Text(title)
                .fontWeight(.semibold)
                .foregroundColor(Color(red: 0.157, green: 0.1568627450980392, blue: 0.1568627450980392))
                .font(.footnote)
        }
        
        
        
            
    }
}

struct inputField_Previews: PreviewProvider {
    static var previews: some View {
        inputField(text: .constant(""), title: "Username", placeHolder: "Username")
    }
}
