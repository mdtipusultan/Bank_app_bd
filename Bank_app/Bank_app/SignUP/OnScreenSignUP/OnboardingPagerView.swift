//
//  OnboardingPagerView.swift
//  Bank_app
//
//  Created by Finjet on 6/8/24.
//

import SwiftUI

struct OnboardingPagerView: View {
    @State private var currentPage = 0
    
    init() {
        UIPageControl.appearance().currentPageIndicatorTintColor = UIColor(named: "PrimaryColor") // Set the active dot color
        UIPageControl.appearance().pageIndicatorTintColor = UIColor(named: "accent_2")
    }
    
    var body: some View {
        NavigationView {
            VStack {
                TabView(selection: $currentPage) {
                    FirstScreen(currentPage: $currentPage)
                        .tag(0)
                    SecondScreen(currentPage: $currentPage)
                        .tag(1)
                    ThirdScreen(currentPage: $currentPage)
                        .tag(2)
                }
                
                //                .tabViewStyle(PageTabViewStyle())
                //                .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
                .tabViewStyle(.page)
                .indexViewStyle(.page)
                .padding()
                
                Spacer()
                Spacer()
                
                if currentPage == 2 {
                    NavigationLink(destination: SignUPView()) {
                        Text("Get Started")
                            .foregroundColor(.white)
                            .frame(width: UIScreen.main.bounds.width - 100, height: 48)
                            .background(Color("PrimaryColor"))
                            .cornerRadius(10)
                            .padding()
                    }
                } else {
                    Button(action: {
                        currentPage += 1
                    }) {
                        Text("Get Started")
                            .foregroundColor(.white)
                            .frame(width: UIScreen.main.bounds.width - 100, height: 48)
                            .background(Color("PrimaryColor"))
                            .cornerRadius(10)
                            .padding()
                    }
                }
                
                Spacer()
                Spacer()
                Spacer()
                Spacer()
            }
            
        }
    }
}

struct OnboardingPagerView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingPagerView()
    }
}
