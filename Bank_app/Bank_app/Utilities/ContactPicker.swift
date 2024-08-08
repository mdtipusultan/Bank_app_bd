//
//  ContactPicker.swift
//  Bank_app
//
//  Created by Rezwan Chowdhury on 8/8/24.
//

import SwiftUI
import ContactsUI

// ContactPicker implementation
struct ContactPicker: UIViewControllerRepresentable {
    @Binding var mobileNumber: String

    class Coordinator: NSObject, UINavigationControllerDelegate, CNContactPickerDelegate {
        var parent: ContactPicker

        init(parent: ContactPicker) {
            self.parent = parent
        }

        func contactPicker(_ picker: CNContactPickerViewController, didSelect contact: CNContact) {
            if let phoneNumber = contact.phoneNumbers.first?.value.stringValue {
                parent.mobileNumber = phoneNumber
            }
        }
    }

    func makeCoordinator() -> Coordinator {
        return Coordinator(parent: self)
    }

    func makeUIViewController(context: Context) -> CNContactPickerViewController {
        let picker = CNContactPickerViewController()
        picker.delegate = context.coordinator
        return picker
    }

    func updateUIViewController(_ uiViewController: CNContactPickerViewController, context: Context) {}
}

//#Preview {
//    ContactPicker()
//}
