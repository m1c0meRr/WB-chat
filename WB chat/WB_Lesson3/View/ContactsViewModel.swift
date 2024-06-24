//
//  ContactsViewModel.swift
//  WB chat
//
//  Created by Sergey Savinkov on 18.06.2024.
//

import Foundation

final class ContactsViewModel: ObservableObject {
    @Published var contacts = [Contact]()
    
    private let contactsManager: ContactsManager
    private let router: Router
    
    init(contactsManager: ContactsManager, router: Router) {
        self.contactsManager = contactsManager
        self.router = router
        
        contacts = contactsManager.getContacts()
    }
    
    func showContact(contact: Contact) {
        self.router.showContact(contact: contact)
    }
//
//    func buy() {
//        if cartManager.isAddressFilled() {
//            self.router.showOrderConfirmation()
//        } else {
//            self.router.showAddress()
//        }
//    }
}
