////}
////
////  InputFieldBorder.swift
////  Bank_app
////
////  Created by Finjet on 7/8/24.
////
//
//import SwiftUI
//
//struct InputFieldBorder: View {
//    @Binding var text: String
//    var placeholder: String
//    var fieldName: String
//    var trailingImage: String? = nil
//    var trailingAction: (() -> Void)? = nil
//    var height: CGFloat = 48
//    
//    var body: some View {
//        VStack(alignment: .leading) {
//            Text(fieldName)
//                .font(.headline)
//                .foregroundColor(.primary)
//            
//            HStack {
//                TextField(placeholder, text: $text)
//                    .padding(.horizontal)
//                    .frame(height: height)
//                
//                if trailingImage != nil {
//                    Button(action: {
//                        trailingAction?()
//                    }) {
//                        Image("")
//                            
//                    }
//                    .padding(.trailing, 8)
//                }
//            }
//            .background(Color(UIColor(red: 0.98, green: 0.98, blue: 0.98, alpha: 1.00)))
//            .cornerRadius(8)
//            .overlay(
//                RoundedRectangle(cornerRadius: 8)
//                    .stroke(Color(UIColor(red: 0.18, green: 0.18, blue: 0.18, alpha: 0.2)), lineWidth: 1)
//            )
//        }
//        .padding(.horizontal)
//    }
//}
//
//#Preview {
//    InputFieldBorder(text: .constant(""), placeholder: "Placeholder", fieldName: "Field Name", trailingImage: "calendar", trailingAction: {})
//}

import SwiftUI

struct InputFieldBorder: View {
    @Binding var text: String
    var placeholder: String
    var fieldName: String
    var trailingImage: Image? = nil
    var trailingAction: (() -> Void)? = nil
    var height: CGFloat = 48
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(fieldName)
                .font(.headline)
                .foregroundColor(.primary)
            
            HStack {
                TextField(placeholder, text: $text)
                    .padding(.horizontal)
                    .frame(height: height)
                
                if let image = trailingImage {
                    Button(action: {
                        trailingAction?()
                    }) {
                        image
                    }
                    .padding(.trailing, 8)
                }
            }
            .background(Color(UIColor(red: 0.98, green: 0.98, blue: 0.98, alpha: 1.00)))
            .cornerRadius(8)
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color(UIColor(red: 0.18, green: 0.18, blue: 0.18, alpha: 0.2)), lineWidth: 1)
            )
        }
        .padding(.horizontal)
    }
}

#Preview {
    InputFieldBorder(text: .constant(""), placeholder: "Placeholder", fieldName: "Field Name", trailingImage: Image(systemName: "calendar"), trailingAction: {})
}
