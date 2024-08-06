////
////  FirstScreen.swift
////  Bank_app
////
////  Created by Finjet on 6/8/24.
////
//
//import SwiftUI
//
//struct FirstScreen: View {
//    var body: some View {
//        
//        VStack{
//            Spacer()
//                Image("logo-2")
//                    .frame(width: 184, height: 84, alignment: .center)
//            
//            Text("Welcome to")
//                .font(.system(size: 40))
//                .multilineTextAlignment(.center)
//            
//           
//            Text(" MasterPay.")
//                .foregroundColor(Color("PrimaryColor"))
//                .font(.system(size: 35))
//                .multilineTextAlignment(.center)
//            
//            
//            Text("Your Best Money Transfer Partner.")
//                .font(.footnote)
//                .foregroundColor(.secondary)
//            Spacer()
//            
//            NavigationLink {
//                SecondScreen()
//                    //.navigationBarBackButtonHidden()
//            } label: {
//                HStack {
//                    Text("Get Started")
//                        //.fontWeight(.semibold)
//                }
//                .foregroundColor(.white)
//                .frame(width: UIScreen.main.bounds.width - 100, height: 48)
//            }
//            .background(Color("PrimaryColor"))
//            .cornerRadius(10)
//            Spacer()
//        }
//
//    }
//}
//
//#Preview {
//    FirstScreen()
//}


//
//  FirstScreen.swift
//  Bank_app
//
//  Created by Finjet on 6/8/24.
//

import SwiftUI

struct FirstScreen: View {
    @Binding var currentPage: Int
    
    var body: some View {
        VStack {
            Spacer()
            Image("logo-2")
                .frame(width: 184, height: 84, alignment: .center)
            Text("Welcome to")
                .font(.system(size: 40))
                .bold()
                .multilineTextAlignment(.center)
            Text(" MasterPay.")
                .foregroundColor(Color("PrimaryColor"))
                .bold()
                .font(.system(size: 35))
                .multilineTextAlignment(.center)
            Text("Your Best Money Transfer Partner.")
                .font(.footnote)
                .foregroundColor(.secondary)
                .padding(.top, 1)
            Spacer()
        }
        .padding()
    }
}

#Preview {
    FirstScreen(currentPage: .constant(0))
}
