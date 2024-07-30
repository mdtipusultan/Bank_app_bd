//
//  loginView.swift
//  Bank_app
// Created by Finjet on 29/7/24.

import SwiftUI

struct LoginView: View {
    @State private var username = ""
    @State private var password = ""
    
    @State private var rememberMe = false
    @State var isShowingPassword: Bool = false
    @State private var isLogged = false
    
    
    var body: some View {
       
            NavigationStack{
                GeometryReader { geometry in
                    VStack {
                        // Top Safe Area Color
                        Color("AccentColor") // Replace with your desired color
                            .frame(height: geometry.safeAreaInsets.top)
                            .edgesIgnoringSafeArea(.top)
                        VStack{
                            //Spacer()
                            //app logo
                            Image("bank_logo")
                            //                Spacer()
                                .padding()
                                .ignoresSafeArea()
                            
                            
                            //form
                            
                            // Username TextField
                            VStack(alignment: .trailing) {
                                
                                TextField("Enter your Username", text: $username)
                                
                                    .padding(.vertical, 10)
                                    .padding(.horizontal, 10)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 5)
                                            .stroke(Color.black, lineWidth: 1)
                                    )
                                
                                Text("User ID")
                            }
                            .padding(.horizontal)
                            
                            // Password SecureField
                            
                            VStack(alignment: .trailing) {
                                
                                HStack {
                                    Group {
                                        if isShowingPassword {
                                            TextField("Enter your password", text: $password)
                                        } else {
                                            SecureField("Enter your password", text: $password)
                                        }
                                    }
                                    .disableAutocorrection(true)
                                    .autocapitalization(.none)
                                    .padding(.vertical, 10)
                                    .padding(.horizontal, 10)
                                    .overlay(alignment: .leading){
                                        RoundedRectangle(cornerRadius: 5)
                                            .stroke(Color.black, lineWidth: 1)
                                        
                                        Button(action: {
                                            isShowingPassword.toggle()
                                        }) {
                                            Image(systemName: isShowingPassword ? "eye.slash.fill" : "eye.fill")
                                                .foregroundColor(.black)
                                        }
                                        .padding(.leading, 300)
                                        
                                    }
                                    
                                }
                                Text("User Password")
                            }
                            .padding(.horizontal)
                            
                            //                    //remember & forget button
                            //                    HStack{
                            //                        HStack{
                            //                            Image(systemName: rememberMe ? "checkmark.square.fill" : "square") // Use system icons for checkbox appearance
                            //                                .resizable()
                            //                                .frame(width: 20, height: 20)
                            //                                .foregroundColor(.black)
                            //                                .onTapGesture {
                            //                                    rememberMe.toggle() // Toggle the state variable on tap
                            //                                }
                            //                            Text("Remember me")
                            //                                .fontWeight(.light)
                            //                                .font(.system(size: 14))
                            //                            //.padding(.leading, -5)
                            //                        }
                            //                        .padding(.leading, 20)
                            //                        Spacer()
                            //                        NavigationLink {
                            //                            //password_recovery()
                            //                                //.navigationTitle("Password Recovery")
                            //
                            //                        } label: {
                            //                            HStack{
                            //                                Text("Forget Password?")
                            //                                    .fontWeight(.medium)
                            //                                    .underline()
                            //                                    .foregroundColor(Color("AccentColor"))
                            //                            }
                            //                            .font(.system(size: 14))
                            //                        }
                            //                        .padding(.top,10)
                            //                        .padding(.trailing,20)
                            //                    }
                            //
                            
                            
                            //LOGIN button
                            
                            HStack {
                                NavigationLink {
                                    HomeView()
                                        .navigationBarBackButtonHidden()
                                } label: {
                                    HStack{
                                        Text("Login")
                                            .fontWeight(.semibold)
                                    }
                                    .foregroundColor(.white)
                                    .frame(width: UIScreen.main.bounds.width - 100, height: 48)
                                }
                                .background(Color("AccentColor"))
                                .cornerRadius(10)
                                
                                NavigationLink {
                                    // HomeView()
                                    //.navigationBarBackButtonHidden()
                                } label: {
                                    HStack{
                                        //Text("Fingerprint")
                                        //.fontWeight(.semibold)
                                        Image("Fingerprint")
                                    }
                                    .foregroundColor(.white)
                                }
                                .cornerRadius(10)
                                
                            }
                            
                            //singleLine
                            //#C2C2C2
                            Divider()
                                .background(Color(red: 194/255, green: 194/255, blue: 194/255)) // Set the divider color
                                .frame(width: 200, height: 1) // Adjust the width and height of the divider
                                .padding(.top, 20) // Add top padding
                            
                            //SIGN-UP BUTTON
                            NavigationLink {
                                //RegistrationView()
                                //.navigationTitle("Registration")
                                
                            } label: {
                                HStack{
                                    Text("New in Master Pay ?")
                                        .foregroundColor(Color.black)
                                    Text("Sign Up")
                                        .fontWeight(.medium)
                                        .underline()
                                        .foregroundColor(Color("accent_2"))
                                }
                                .font(.system(size: 14))
                            }
                            .padding(.top,10)
                            
                            //                Spacer()
                            
                            
                            //ekyc
                            VStack {
                                Button(action: {
                                    // Action to perform when button is pressed
                                    print("Button pressed")
                                }) {
                                    HStack {
                                        Spacer()
                                        Image("demo_logo_ekyc")
                                        //.foregroundColor(.white)
                                        Spacer()
                                        Text("Open Bank Account")
                                            .foregroundColor(Color("AccentColor"))
                                            .bold()
                                        Spacer()
                                        Spacer()
                                    }
                                    .frame(width: UIScreen.main.bounds.width - 60, height: 48)
                                    //.padding()
                                    .overlay(
                                        RoundedRectangle(cornerRadius:10)
                                            .stroke(Color("AccentColor"), lineWidth: 1)
                                    )
                                    .cornerRadius(10)
                                    
                                }
                                
                                
                            }
                            
                            .padding()
                            
                            Spacer()
                            
                            //BUTTONS
                            HStack {
                                Spacer()
                                Spacer()
                                Button(action: {
                                    // Action for the first button
                                    print("Button 1 pressed")
                                }) {
                                    VStack {
                                        Image("location")
                                        Text("Location")
                                            .font(.footnote)
                                            .fontWeight(.light)
                                            .foregroundColor(Color(uiColor: UIColor(red: 0.46, green: 0.46, blue: 0.46, alpha: 1.00)))
                                        
                                        
                                    }
                                }
                                
                                Spacer()
                                Divider()
                                    .frame(height: 50)
                                    .background(Color.gray)
                                Spacer()
                                
                                Button(action: {
                                    // Action for the second button
                                    print("Button 2 pressed")
                                }) {
                                    VStack {
                                        Image("contact")
                                        Text("Contact")
                                            .font(.footnote)
                                            .fontWeight(.light)
                                            .foregroundColor(Color(uiColor: UIColor(red: 0.46, green: 0.46, blue: 0.46, alpha: 1.00)))
                                        
                                    }
                                }
                                
                                Spacer()
                                Divider()
                                    .frame(height: 50)
                                    .background(Color.gray)
                                Spacer()
                                
                                Button(action: {
                                    // Action for the third button
                                    print("Button 3 pressed")
                                }) {
                                    VStack {
                                        Image("explore")
                                        Text("Explore")
                                            .font(.footnote)
                                            .fontWeight(.light)
                                            .foregroundColor(Color(uiColor: UIColor(red: 0.46, green: 0.46, blue: 0.46, alpha: 1.00)))
                                        
                                    }
                                }
                                Spacer()
                                Spacer()
                            }
                            .padding()
                            
                            //Spacer()
                        }
                    }
                }
            
        }
        //.topSafeAreaColor()

    }
    
    
    
}


struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
