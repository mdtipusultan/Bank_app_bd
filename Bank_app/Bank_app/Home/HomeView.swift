//
//  homeView.swift
//  Bank_app
//
//  Created by Finjet on 30/7/24.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                
                // ProfileSection Section
              
                    ProfileSectionView()
                        .frame(maxWidth: .infinity)
               
                
                // Recent Transactions Section
                RecentTransactionsSectionView(transactions: [
                    Transaction(description: "Starbucks", amount: "-$5.00", date: "Jul 30"),
                    Transaction(description: "Amazon", amount: "-$50.00", date: "Jul 29"),
                    Transaction(description: "Salary", amount: "+$3000.00", date: "Jul 28")
                ])
                
                // Offers Section
                OffersSectionView(offers: [
                    "Get 10% cashback on dining",
                    "5% discount on electronics",
                    "2x reward points on travel bookings"
                ])
                
                // Help & Support Section
                HelpSupportSectionView()
            }
            //.padding()
        }
    }
}

// Balance Section
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
                    //.foregroundColor(.yellow)
            }
            
            Button(action: {
                // Handle logout action
            }) {
                Image("logout")
                    .resizable()
                    .frame(width: 25, height: 25)
                    //.foregroundColor(.blue)
            }
        }
        .padding(.leading)
        .padding(.trailing)
        //.background(Color(.systemBackground))
        Divider()
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

// Offers Section
struct OffersSectionView: View {
    let offers: [String]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Offers")
                .font(.headline)
            
            ForEach(offers, id: \.self) { offer in
                Text("• \(offer)")
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
