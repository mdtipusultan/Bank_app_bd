//
//  homeView.swift
//  Bank_app
//
//  Created by Finjet on 30/7/24.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 20) {
                    
                    // ProfileSection Section
                    ProfileSectionView()
                        .frame(maxWidth: .infinity)
                    
                    // Image Collection Section
                    ImageCollectionSectionView(images: [
                        "Account card box", "Account card box", "Account card box", "Account card box"
                    ])
                    
                    
                    // Icon Grid Section
                    IconGridSectionView(icons: [
                        "transfer", "exchange rate", "billpay", "topup",
                        "history", "prayer-time", "request", "more"
                    ], moreIcons: [
                        "history", "prayer-time", "request", "exchange rate"
                    ])
                    
                    
                    // Exclusive Section
                                       ExclusiveSectionView(images: [
                                           "banner", "banner", "banner", "banner"
                                       ])
                   
                }
                //.padding()
            }
            //.navigationTitle("Home")
        }
    }
}

// Profile Section
struct ProfileSectionView: View {
    var body: some View {
        HStack(spacing: 20) {
            Button(action: {
                // Handle profile image tap action
            }) {
                Image(systemName: "person.circle.fill")
                    .resizable()
                    .frame(width: 50, height: 50)
            }
            .buttonStyle(PlainButtonStyle())
            
            VStack(alignment: .leading) {
                Text("Welcome")
                    .font(.footnote)
                    .foregroundColor(.secondary)
                
                Text("Tipu Sultan")
                    .font(.headline)
            }
            
            Spacer()
            
            Button(action: {
                // Handle notification action
            }) {
                Image("bell")
                    .resizable()
                    .frame(width: 25, height: 25)
            }
            
            Button(action: {
                // Handle logout action
            }) {
                Image("logout")
                    .resizable()
                    .frame(width: 25, height: 25)
            }
        }
        .padding(.leading)
        .padding(.trailing)
        Divider()
    }
}

//struct ImageCollectionSectionView: View {
//    let images: [String]
//    @State private var selectedIndex = 0
//
//    var body: some View {
//        VStack {
//            TabView(selection: $selectedIndex) {
//                ForEach(0..<images.count, id: \.self) { index in
//                    NavigationLink(destination: ImageDetailView(imageName: images[index])) {
//                        Image(images[index])
//                            .resizable()
//                            .aspectRatio(contentMode: .fill)
//                            .frame(width: UIScreen.main.bounds.width - 60, height: 200)
//                            .clipped()
//                            .cornerRadius(10)
//                            .tag(index)
//                    }
//                }
//            }
//            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
//            .frame(height: 200)
//
//            HStack {
//                ForEach(0..<images.count, id: \.self) { index in
//                    Circle()
//                        .fill(index == selectedIndex ? Color.black : Color.gray)
//                        .frame(width: 8, height: 8)
//                }
//            }
//            .padding(.top, 8)
//        }
//    }
//}


struct ImageCollectionSectionView: View {
    let images: [String]
    @State private var selectedIndex = 0
    
    var body: some View {
        VStack {
            TabView(selection: $selectedIndex) {
                ForEach(0..<images.count, id: \.self) { index in
                    NavigationLink(destination: ImageDetailView(imageName: images[index])) {
                        Image(images[index])
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: UIScreen.main.bounds.width - 40, height: 200) // Adjust width for partial views
                            .clipped()
                            .cornerRadius(10)
                            .tag(index)
                    }
                    //.padding(.horizontal, 20) // Add padding for partial views
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            .frame(height: 200)
            
            HStack {
                ForEach(0..<images.count, id: \.self) { index in
                    Circle()
                        .fill(index == selectedIndex ? Color.black : Color.gray)
                        .frame(width: 8, height: 8)
                }
            }
            .padding(.top, 8)
        }
    }
}


// Image Detail View
struct ImageDetailView: View {
    let imageName: String
    
    var body: some View {
        VStack {
            Image(imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .navigationTitle("Detail View")
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}

// Icon Grid Section
struct IconGridSectionView: View {
    let icons: [String]
    let moreIcons: [String]
    
    let rows = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        VStack(alignment: .leading) {
            
            LazyHGrid(rows: rows) {
                ForEach(Array(icons.prefix(7)), id: \.self) { iconName in
                    NavigationLink(destination: getDestinationView(for: iconName)) {
                        VStack {
                            Image(iconName)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                            //.frame(width: 50, height: 50)
                        }
                        //.frame(width: 100, height: 100)
                        //.background(Color(.systemGray6))
                        .cornerRadius(10)
                    }
                }
                
                if icons.count > 7 {
                    NavigationLink(destination: MoreView(moreIcons: moreIcons)) {
                        VStack {
                            Image("more")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                        }
                        .cornerRadius(10)
                    }
                }
            }
            .padding()
        }
    }
    
    @ViewBuilder
    func getDestinationView(for icon: String) -> some View {
        switch icon {
        case "transfer":
            TransferView()
        case "exchange rate":
            ExchangeRateView()
        case "billpay":
            BillPayView()
        case "topup":
            TopUpView()
        case "history":
            HistoryView()
        case "prayer-time":
            PrayerTimeView()
        case "request":
            RequestView()
        case "more":
            MoreView(moreIcons: moreIcons)
        default:
            EmptyView()
        }
    }
}

// Views for each icon
struct TransferView: View {
    var body: some View {
        Text("Transfer View")
            .navigationTitle("Transfer")
    }
}

struct ExchangeRateView: View {
    var body: some View {
        Text("Exchange Rate View")
            .navigationTitle("Exchange Rate")
    }
}

struct BillPayView: View {
    var body: some View {
        Text("Bill Pay View")
            .navigationTitle("Bill Pay")
    }
}


struct HistoryView: View {
    var body: some View {
        Text("History View")
            .navigationTitle("History")
    }
}

struct PrayerTimeView: View {
    var body: some View {
        Text("Prayer Time View")
            .navigationTitle("Prayer Time")
    }
}

struct RequestView: View {
    var body: some View {
        Text("Request View")
            .navigationTitle("Request")
    }
}

// More View to handle additional icons
struct MoreView: View {
    let moreIcons: [String]
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 20) {
                ForEach(moreIcons, id: \.self) { iconName in
                    NavigationLink(destination: getDestinationView(for: iconName)) {
                        VStack {
                            Image(iconName)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                            
                        }
                        .frame(width: 100, height: 100)
                        .cornerRadius(10)
                    }
                }
            }
            .padding()
        }
        .navigationTitle("More Actions")
    }
    
    @ViewBuilder
    func getDestinationView(for icon: String) -> some View {
        switch icon {
        case "transfer":
            TransferView()
        case "exchange rate":
            ExchangeRateView()
        case "billpay":
            BillPayView()
        case "topup":
            TopUpView()
        case "history":
            HistoryView()
        case "prayer-time":
            PrayerTimeView()
        case "request":
            RequestView()
        default:
            EmptyView()
        }
    }
}

// Exclusive Section
struct ExclusiveSectionView: View {
    
    let images: [String]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Exclusive")
                .font(.headline)
            
            ScrollView(.horizontal, showsIndicators: false) {
                      HStack(spacing: 15) {
                          ForEach(images, id: \.self) { imageName in
                              Image(imageName)
                                  .resizable()
                                  .aspectRatio(contentMode: .fill)
                                  //.frame(width: 150, height: 150)
                                  .clipped()
                                  .cornerRadius(10)
                          }
                      }
                      //.padding(.horizontal)
                  }
            
        }
        .padding()
        
        //.background(Color(.systemBackground))
        .cornerRadius(10)
        //.shadow(radius: 5)
    }
}

#Preview {
    HomeView()
}


