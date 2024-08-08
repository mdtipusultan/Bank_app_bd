//
//  SignUPView.swift
//  Bank_app
//
//  Created by Finjet on 1/8/24.
//
import SwiftUI

struct SignUpSubmitView: View {
    // State variable to track the selected button
    @State private var selectedButton: Int? = nil // No button selected by default
    
    // State variables for each OTP digit
    @State private var otpDigits: [String] = Array(repeating: "", count: 6)
    
    var body: some View {
        VStack {
            Text("Please complete your payment confirmation Via:")
                .font(.system(size: 13))
                .multilineTextAlignment(.leading)
            //.padding(.bottom, 20)
            
            
            HStack {
                Button(action: {
                    selectedButton = 1
                }) {
                    Image("biomectic")
                        .resizable()
                        .frame(width: 100, height: 100)
                        .background(Color(red: 0.965, green: 0.965, blue: 0.965))
                        .cornerRadius(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(selectedButton == 1 ? Color("PrimaryColor") : Color.clear, lineWidth: 1)
                        )
                }
                
                Button(action: {
                    selectedButton = 2
                }) {
                    Image("sms")
                        .resizable()
                        .frame(width: 100, height: 100)
                        .background(Color(red: 0.965, green: 0.965, blue: 0.965))
                        .cornerRadius(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(selectedButton == 2 ? Color("PrimaryColor") : Color.clear, lineWidth: 1)
                        )
                }
                
                Button(action: {
                    selectedButton = 3
                }) {
                    Image("email")
                        .resizable()
                        .frame(width: 100, height: 100)
                        .background(Color(red: 0.965, green: 0.965, blue: 0.965))
                        .cornerRadius(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(selectedButton == 3 ? Color("PrimaryColor") : Color.clear, lineWidth: 1)
                        )
                }
            }
            .padding()
            
            Divider()
                .padding(.horizontal)
                .padding(.horizontal)
            
            Image("OTP_image")
                .padding()
            
            Text("OTP Verification")
                .foregroundColor(Color(UIColor(red: 0.36, green: 0.36, blue: 0.36, alpha: 1.00)))
                .padding(.bottom)
            Text("Enter verification code we just sent in your verified mobile number 0176********40")
                .multilineTextAlignment(.center)
                .font(.system(size: 12))
                .foregroundColor(Color(UIColor(red: 0.23, green: 0.23, blue: 0.23, alpha: 1.00)))
            
                .padding(.horizontal,40)
            
            
            // OTP Input Fields
              HStack(spacing: 10) {
                  ForEach(0..<6, id: \.self) { index in
                      TextField("", text: $otpDigits[index])
                          .frame(width: 40, height: 50)
                          .font(.system(size: 24))
                          .multilineTextAlignment(.center)
                          .background(Color(UIColor(red: 0.95, green: 0.95, blue: 0.95, alpha: 1.00)))
                          .cornerRadius(5)
                          .keyboardType(.numberPad)
                          .overlay(
                              RoundedRectangle(cornerRadius: 5)
                                  .stroke(Color.gray, lineWidth: 1)
                          )
                          .onChange(of: otpDigits[index]) { newValue in
                              if newValue.count > 1 {
                                  otpDigits[index] = String(newValue.prefix(1))
                              }
                          }
                  }
              }
              .padding(.top, 20)
            
        }
        .navigationTitle("Sign Up")
    }
}

#Preview {
    SignUpSubmitView()
}
