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
        NavigationStack {
            GeometryReader { geometry in
                VStack {
                    Color("ThemeColor")
                        .frame(height: geometry.safeAreaInsets.top)
                        .edgesIgnoringSafeArea(.top)
                    
                    VStack {
                        Image("bank_logo")
                            .padding()
                            .ignoresSafeArea()
                            .padding(.top, -60)
                        
                        VStack(alignment: .trailing) {
                            TextField("Enter your Username", text: $username)
                                .padding(.vertical, 10)
                                .padding(.horizontal, 10)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 5)
                                        .stroke(Color.black, lineWidth: 1)
                                )
                            
                            NavigationLink(destination: ForgotUserIDView()) {
                                Text("Forgot User ID")
                                    .foregroundColor(Color("PrimaryColor"))
                            }
                        }
                        .padding(.horizontal)
                        
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
                                .overlay(alignment: .leading) {
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
                            
                            NavigationLink(destination: ForgotPasswordView()) {
                                Text("Forgot password")
                                    .foregroundColor(Color("PrimaryColor"))
                            }
                        }
                        .padding(.horizontal)
                        
                        HStack {
                            NavigationLink {
                                BaseHome()
                                    .navigationBarBackButtonHidden()
                            } label: {
                                HStack {
                                    Text("Login")
                                        .fontWeight(.semibold)
                                }
                                .foregroundColor(.white)
                                .frame(width: UIScreen.main.bounds.width - 100, height: 48)
                            }
                            .background(Color("PrimaryColor"))
                            .cornerRadius(10)
                            
                            NavigationLink {
                                // Destination view for Fingerprint
                            } label: {
                                HStack {
                                    Image("Fingerprint")
                                }
                                .foregroundColor(.white)
                            }
                            .cornerRadius(10)
                        }
                        
                        Divider()
                            .background(Color(red: 194/255, green: 194/255, blue: 194/255))
                            .frame(width: 200, height: 1)
                            .padding(.top, 20)
                        
                        NavigationLink {
                            // Destination view for Registration
                            FirstScreen()
                                .navigationTitle("Signup")
                                
                        } label: {
                            HStack {
                                Text("New in Master Pay ?")
                                    .foregroundColor(Color.black)
                                Text("Sign Up")
                                    .fontWeight(.medium)
                                    .underline()
                                    .foregroundColor(Color("accent_2"))
                            }
                            .font(.system(size: 14))
                        }
                        .padding(.top, 10)
                        
                        NavigationLink(destination: OpenBankAccountView()) {
                            HStack {
                                Spacer()
                                Image("demo_logo_ekyc")
                                Spacer()
                                Text("Open Bank Account")
                                    .foregroundColor(Color("PrimaryColor"))
                                    .bold()
                                Spacer()
                                Spacer()
                            }
                            .frame(width: UIScreen.main.bounds.width - 60, height: 48)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color("PrimaryColor"), lineWidth: 1)
                            )
                            .cornerRadius(10)
                        }
                        .padding(.top, 20)
                        
                        Spacer()
                        
                        HStack {
                            Spacer()
                            Spacer()
                            NavigationLink(destination: LocationView()) {
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
                            
                            NavigationLink(destination: ContactView()) {
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
                            
                            NavigationLink(destination: ExploreView()) {
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
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

// Dummy views for navigation
struct ForgotUserIDView: View {
    var body: some View {
        Text("Forgot User ID View")
            .navigationTitle("Forgot User ID")
    }
}

struct ForgotPasswordView: View {
    var body: some View {
        Text("Forgot Password View")
            .navigationTitle("Forgot Password")
    }
}

struct OpenBankAccountView: View {
    var body: some View {
        Text("Open Bank Account View")
            .navigationTitle("Open Bank Account")
    }
}

struct LocationView: View {
    var body: some View {
        Text("Location View")
            .navigationTitle("Location")
    }
}

struct ContactView: View {
    var body: some View {
        Text("Contact View")
            .navigationTitle("Contact")
    }
}

struct ExploreView: View {
    var body: some View {
        Text("Explore View")
            .navigationTitle("Explore")
    }
}
