//
//  ContacttList.swift
//  WB chat
//
//  Created by Sergey Savinkov on 01.08.2024.
//

// ImageLoader class
import SwiftUI

struct ContactList: View {
    @State private var contactsData = contactData

    @State private var images: [Int: UIImage] = [:]

    var body: some View {
        List(contactsData) { contactsData in
            HStack {
                Image(uiImage: images[contactsData.id] ?? UIImage())
                    .resizable()
                    .frame(width: 40, height: 40)
                    .clipShape(Circle())
                Text(contactsData.name)
            }
            .onAppear {
                loadAvatar(for: contactsData)
            }
        }
    }

    private func loadAvatar(for Contactt: Contactt) {
        let loader = ImageLoader(url: Contactt.avatarURL)
        loader.load { [contactId = Contactt.id] image in
            self.images[contactId] = image
        }
    }
}

#Preview {
    ContactList()
}
