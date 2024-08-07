//
//  SignUPView.swift
//  Bank_app
//
//  Created by Finjet on 1/8/24.
//

import SwiftUI

struct SignUPView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var selectedAccountType: AccountType = .regular
    
    // State variables for the input fields
    @State private var firstName: String = ""
    @State private var lastName: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var confirmPassword: String = ""
    @State private var phoneNumber: String = ""
    
    var body: some View {
        VStack {
            Picker("Account Type", selection: $selectedAccountType) {
                ForEach(AccountType.allCases, id: \.self) { type in
                    Text(type.rawValue.capitalized)
                        .tag(type)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            //.frame(height: 45)
            .scaleEffect(CGSize(width: 1, height: 1.2))
            .scaledToFit()
            .padding(8)
            .background(Color(UIColor(red: 0.93, green: 0.93, blue: 0.93, alpha: 1.00)))
            .cornerRadius(15)
            .padding()
            
            
            // input fields
                    InputFieldBorder(text: $firstName, placeholder: "First Name", fieldName: "First Name")
                    InputFieldBorder(text: $lastName, placeholder: "Last Name", fieldName: "Last Name")
                    InputFieldBorder(text: $email, placeholder: "Email", fieldName: "Email")
                    InputFieldBorder(text: $password, placeholder: "Password", fieldName: "Password")
                   InputFieldBorder(text: $confirmPassword, placeholder: "Confirm Password", fieldName: "Confirm Password")
                    InputFieldBorder(text: $phoneNumber, placeholder: "Phone Number", fieldName: "Phone Number")
            
            Spacer()
        }
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

enum AccountType: String, CaseIterable {
    case regular
    case propertoship
}

#Preview {
    SignUPView()
}
