//import SwiftUI
//
//struct TopUpView: View {
//    @State private var selectedOption = ""
//    @State private var mobileNumber = ""
//
//    var body: some View {
//        VStack(spacing: 20) {
//            DropdownView(selectedOption: $selectedOption, options: ["Option 1", "Option 2", "Option 3"], placeholder: "Select a Card")
//
//            InputFieldBorder(
//                text: $mobileNumber,
//                placeholder: "Enter your user ID",
//                fieldName: "Mobile Number",
//                trailingImage: Image("phone_book"),
//                trailingAction: {
//                   
//                }
//            )
//
//            
//            Spacer()
//        }
//        .padding()
//        .navigationTitle("Top Up")
//    }
//}
//
//#Preview {
//    TopUpView()
//}

import SwiftUI
import ContactsUI

struct TopUpView: View {
    @State private var selectedOption = ""
    @State private var mobileNumber = ""
    @State private var showingContactPicker = false

    var body: some View {
        VStack(spacing: 20) {
            DropdownView(selectedOption: $selectedOption, options: ["Option 1", "Option 2", "Option 3"], placeholder: "Select a Card")

            InputFieldBorder(
                text: $mobileNumber,
                placeholder: "Enter your user ID",
                fieldName: "Mobile Number",
                trailingImage: Image("phone_book"),
                trailingAction: {
                    showingContactPicker = true
                }
            )
            .sheet(isPresented: $showingContactPicker) {
                ContactPicker(mobileNumber: $mobileNumber)
            }

            Spacer()
        }
        .padding()
        .navigationTitle("Top Up")
    }
}

#Preview {
    TopUpView()
}
