////
////  SignUPView.swift
////  Bank_app
////
////  Created by Finjet on 1/8/24.
////
//
//import SwiftUI
//
//struct SignUPView: View {
//    @Environment(\.presentationMode) var presentationMode
//    @State private var selectedAccountType: AccountType = .regular
//    
//    // State variables for the input fields
//    @State private var UserID: String = ""
//    @State private var AccountNumber: String = ""
//    @State private var AccountName: String = ""
//    @State private var MobileNumber: String = ""
//    @State private var DateOfBirth: String = ""
//    @State private var NIDno: String = ""
//    
//    // State variables for the date picker
//    @State private var isDatePickerPresented = false
//    @State private var selectedDate = Date()
//    
//    var body: some View {
//        ScrollView {
//            VStack {
//                Picker("Account Type", selection: $selectedAccountType) {
//                    ForEach(AccountType.allCases, id: \.self) { type in
//                        Text(type.rawValue.capitalized)
//                            .tag(type)
//                    }
//                }
//                .pickerStyle(SegmentedPickerStyle())
//                .frame(height: 45)
//                .scaleEffect(CGSize(width: 1, height: 1.2))
//                .scaledToFit()
//                .padding(8)
//                //.background(Color.secondary)
//                .background(Color(UIColor(red: 0.93, green: 0.93, blue: 0.93, alpha: 1.00)))
//                .cornerRadius(15)
//                .padding()
//                
//                
//                // input fields
//                InputFieldBorder(text: $UserID, placeholder: "Enter your user ID", fieldName: "User ID")
//                InputFieldBorder(text: $AccountNumber, placeholder: "Enter your account number", fieldName: "Account Number")
//                InputFieldBorder(text: $AccountName, placeholder: "Enter your account name", fieldName: "Account Name")
//                InputFieldBorder(text: $MobileNumber, placeholder: "Enter your mobile number", fieldName: "Mobile Number")
//                    .textContentType(.telephoneNumber)
//
//                //InputFieldBorder(text: $DateOfBirth, placeholder: "DD/MM/YYYY", fieldName: "Date Of Birth")
//                InputFieldBorder(
//                                   text: $DateOfBirth,
//                                   placeholder: "DD/MM/YYYY",
//                                   fieldName: "Date Of Birth",
//                                   trailingImage: "calendar",
//                                   trailingAction: {
//                                       isDatePickerPresented = true
//                                   }
//                               )
//
//                InputFieldBorder(text: $NIDno, placeholder: "Enter your NID number", fieldName: "NID no")
//                
//                
//                HStack{
//                    Button {
//                        //
//                    } label: {
//                        Image("mark")
//                    }
//                    
//                    Text("I agree with this")
//                        .font(.system(size: 13))
//                    Text("Terms & Conditions")
//                        .font(.system(size: 13))
//                        .foregroundColor(Color("PrimaryColor"))
//                }
//                .padding()
//                
//                NavigationLink {
//                    SignUpSubmitView()
//                        //.navigationBarBackButtonHidden()
//                } label: {
//                    HStack {
//                        Text("Next")
//                            .fontWeight(.semibold)
//                    }
//                    .foregroundColor(.white)
//                    .frame(width: UIScreen.main.bounds.width - 100, height: 48)
//                }
//                .background(Color("PrimaryColor"))
//                .cornerRadius(10)
//            }
//        }
//        
//        .navigationTitle("Sign Up")
//        .navigationBarBackButtonHidden(true)
//        .navigationBarItems(leading: backButton)
//        .sheet(isPresented: $isDatePickerPresented) {
//            VStack {
//                DatePicker(
//                    "Select Date",
//                    selection: $selectedDate,
//                    displayedComponents: .date
//                )
//                .datePickerStyle(WheelDatePickerStyle())
//                .labelsHidden()
//                
//                Button("Done") {
//                    let dateFormatter = DateFormatter()
//                    dateFormatter.dateFormat = "dd/MM/yyyy"
//                    DateOfBirth = dateFormatter.string(from: selectedDate)
//                    isDatePickerPresented = false
//                }
//                .padding()
//            }
//        }
//    }
//    
//    private var backButton: some View {
//        Button(action: {
//            presentationMode.wrappedValue.dismiss()
//            print("Back button pressed")
//        }) {
//            HStack {
//                Image(systemName: "chevron.left")
//                    .foregroundColor(.blue)
//                Text("")
//                    .foregroundColor(.clear)
//            }
//        }
//    }
//}
//
//enum AccountType: String, CaseIterable {
//    case regular
//    case propertoship
//}
//
//#Preview {
//    SignUPView()
//}


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
    @State private var UserID: String = ""
    @State private var AccountNumber: String = ""
    @State private var AccountName: String = ""
    @State private var MobileNumber: String = ""
    @State private var DateOfBirth: String = ""
    @State private var NIDno: String = ""
    
    // State variables for the date picker
    @State private var isDatePickerPresented = false
    @State private var selectedDate = Date()

    // State variable for terms and conditions
    @State private var isAgreeTerms = false

    var body: some View {
        ScrollView {
            VStack {
                Picker("Account Type", selection: $selectedAccountType) {
                    ForEach(AccountType.allCases, id: \.self) { type in
                        Text(type.rawValue.capitalized)
                            .tag(type)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                .frame(height: 45)
                .scaleEffect(CGSize(width: 1, height: 1.2))
                .scaledToFit()
                .padding(8)
                .background(Color(UIColor(red: 0.93, green: 0.93, blue: 0.93, alpha: 1.00)))
                .cornerRadius(15)
                .padding()
                
                // Input fields
                InputFieldBorder(text: $UserID, placeholder: "Enter your user ID", fieldName: "User ID")
                InputFieldBorder(text: $AccountNumber, placeholder: "Enter your account number", fieldName: "Account Number")
                InputFieldBorder(text: $AccountName, placeholder: "Enter your account name", fieldName: "Account Name")
                InputFieldBorder(text: $MobileNumber, placeholder: "Enter your mobile number", fieldName: "Mobile Number")
                
                InputFieldBorder(
                    text: $DateOfBirth,
                    placeholder: "DD/MM/YYYY",
                    fieldName: "Date Of Birth",
                    trailingImage: Image("calendar"),
                    trailingAction: {
                        isDatePickerPresented = true
                    }
                )
                
                InputFieldBorder(text: $NIDno, placeholder: "Enter your NID number", fieldName: "NID no")
                
                // Terms and Conditions
                HStack {
                    Button(action: {
                        isAgreeTerms.toggle()
                    }) {
                        HStack {
                            Image(systemName: isAgreeTerms ? "checkmark.square" : "square")
                                .foregroundColor(isAgreeTerms ? Color.blue : Color.gray)
                            Text("I agree with the")
                                .font(.system(size: 13))
                                .foregroundColor(.black)
                            Text("Terms & Conditions")
                                .font(.system(size: 13))
                                .foregroundColor(Color("PrimaryColor"))
                        }
                    }
                }
                .padding()
                
                NavigationLink {
                    SignUpSubmitView()
                } label: {
                    HStack {
                        Text("Next")
                            .fontWeight(.semibold)
                    }
                    .foregroundColor(.white)
                    .frame(width: UIScreen.main.bounds.width - 100, height: 48)
                }
                .background(Color("PrimaryColor"))
                .cornerRadius(10)
            }
        }
        .navigationTitle("Sign Up")
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: backButton)
        .sheet(isPresented: $isDatePickerPresented) {
            VStack {
                DatePicker(
                    "Select Date",
                    selection: $selectedDate,
                    displayedComponents: .date
                )
                .datePickerStyle(WheelDatePickerStyle())
                .labelsHidden()
                
                Button("Done") {
                    let dateFormatter = DateFormatter()
                    dateFormatter.dateFormat = "dd/MM/yyyy"
                    DateOfBirth = dateFormatter.string(from: selectedDate)
                    isDatePickerPresented = false
                }
                .padding()
            }
        }
    }
    
    private var backButton: some View {
        Button(action: {
            presentationMode.wrappedValue.dismiss()
            print("Back button pressed")
        }) {
            HStack {
                Image(systemName: "chevron.left")
                    .foregroundColor(.blue)
                Text("")
                    .foregroundColor(.clear)
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
