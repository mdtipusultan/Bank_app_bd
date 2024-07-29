//
//  loginView.swift
//  Bank_app
//
//  Created by Rezwan Chowdhury on 29/7/24.
//

import SwiftUI

struct LoginView: View {
    @State private var username = ""
    @State private var password = ""
    
    @State private var rememberMe = false
    @State var isShowingPassword: Bool = false
    @State private var isLogged = false
   
    
    var body: some View {
        
            NavigationStack{
                VStack{
                    Spacer()
                    //app name
                    Image("Capita")
                        .resizable()
                        .frame(width: 123, height: 46)
                        .foregroundColor(.black)
                    //Spacer()
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
                                .padding(.leading, 280)
                                
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
                    NavigationLink {
                       // HomeView()
                            //.navigationBarBackButtonHidden()
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
                    .padding(.top,35)
                    
                    
                    //SIGN-UP BUTTON
                    NavigationLink {
                        //RegistrationView()
                            //.navigationTitle("Registration")
                        
                    } label: {
                        HStack{
                            Text("I don't have an account?")
                                .foregroundColor(Color.black)
                            Text("Sign Up")
                                .fontWeight(.medium)
                                .underline()
                                .foregroundColor(Color("AccentColor"))
                        }
                        .font(.system(size: 14))
                    }
                    .padding(.top,10)
                    
                    
                    
                    //FACE OR TOUCH ID image
                    Image("face_id") // Display Face ID or Touch ID image
                        .resizable()
                        .frame(width: 60, height: 60)
                        .foregroundColor(.black) // Set the image color if needed
                        .padding(.top,30)
                    
                    //ADDING FACE OR TOUCHID
//                    NavigationLink(destination: BiometricAuthView {
//                        // Closure to handle successful biometric authentication
//                        print("Biometric authentication successful")
//                        // Proceed with login or any action after successful authentication
//                    }) {
//                        HStack{
//                            Text("Don't have TouchID yet?")
//                                .foregroundColor(Color.black)
//                            Text("TouchID")
//                                .fontWeight(.medium)
//                                .underline()
//                                .foregroundColor(Color("AccentColor"))
//                        }
//                        .font(.system(size: 14))
//                    }
//                    .padding(.top,10)
                    Spacer()
                    //shanta-image
                    HStack{
                        Image("ShantaLogo")
                            .resizable()
                            .frame(width: 60, height: 46)
                            .foregroundColor(.black)
                        
                        Text("SHANTA")
                            .fontWeight(.medium)
                            .font(.title)
                            .foregroundColor(Color("AccentColor"))
                    }
                    
                    Spacer()
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
