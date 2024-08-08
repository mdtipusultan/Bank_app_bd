//
//  DropdownView.swift
//  Bank_app
//
//  Created by Finjet on 8/8/24.
//

import SwiftUI

struct DropdownView: View {
    @Binding var selectedOption: String
    @State private var isDropdownExpanded = false
    
    let options: [String]
    let placeholder: String
    
    var body: some View {
        DisclosureGroup(selectedOption.isEmpty ? placeholder : selectedOption, isExpanded: $isDropdownExpanded) {
            VStack {
                ForEach(options, id: \.self) { option in
                    Text(option)
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .onTapGesture {
                            selectedOption = option
                            isDropdownExpanded = false
                        }
                }
            }
        }
        .padding()
        .background(Color(UIColor(red: 0.98, green: 0.98, blue: 0.98, alpha: 1.00)))
        .cornerRadius(10)
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                .stroke(Color.gray, lineWidth: 1)
        )
        .padding(.horizontal)
    }
    
}

//#Preview {
//    StatefulPreviewWrapper("") { DropdownView(selectedOption: $0, options: ["Option 1", "Option 2", "Option 3"], placeholder: "Select an Option") }
//}

#Preview {
    DropdownView(selectedOption: .constant(""), options: ["Option 1", "Option 2", "Option 3"], placeholder: "Select an Option")
}

