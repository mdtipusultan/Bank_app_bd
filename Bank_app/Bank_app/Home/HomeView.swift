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
                    
                    // Recent Transactions Section
                    RecentTransactionsSectionView(transactions: [
                        Transaction(description: "Starbucks", amount: "-$5.00", date: "Jul 30"),
                        Transaction(description: "Amazon", amount: "-$50.00", date: "Jul 29"),
                        Transaction(description: "Salary", amount: "+$3000.00", date: "Jul 28")
                    ])
                    
                    // Help & Support Section
                    HelpSupportSectionView()
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

// Recent Transactions Section
struct RecentTransactionsSectionView: View {
    let transactions: [Transaction]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Recent Transactions")
                .font(.headline)
            
            ForEach(transactions, id: \.id) { transaction in
                HStack {
                    VStack(alignment: .leading) {
                        Text(transaction.description)
                        Text(transaction.date)
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }
                    Spacer()
                    Text(transaction.amount)
                        .foregroundColor(transaction.amount.hasPrefix("-") ? .red : .green)
                }
            }
            
            Divider()
        }
        .padding()
        .background(Color(.systemBackground))
        .cornerRadius(10)
        .shadow(radius: 5)
    }
}

// Help & Support Section
struct HelpSupportSectionView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Help & Support")
                .font(.headline)
            
            Button(action: {
                // Handle contact support action
            }) {
                Text("Contact Support")
                    .font(.body)
                    .foregroundColor(.blue)
            }
            
            Divider()
        }
        .padding()
        .background(Color(.systemBackground))
        .cornerRadius(10)
        .shadow(radius: 5)
    }
}

// Transaction model
struct Transaction: Identifiable {
    let id = UUID()
    let description: String
    let amount: String
    let date: String
}

#Preview {
    HomeView()
}
