//
//  ContacttList.swift
//  WB chat
//
//  Created by Sergey Savinkov on 01.08.2024.
//

// ImageLoader class
import SwiftUI

struct ContacttList: View {
    @State private var Contactts: [Contactt] = [
        Contactt(id: 1, name: "John Doe", avatarURL: URL(string: "https://avatars.mds.yandex.net/i?id=1cf04a6f38f0be15415a0c35010d27a33267ef19-4589186-images-thumbs&n=13")!),
        Contactt(id: 2, name: "Jane Doe", avatarURL: URL(string: "https://avatars.mds.yandex.net/i?id=b2189c4d8d0a9cffc9a98b6339ff1e76c190205c-10415036-images-thumbs&n=13")!),
        
    ]

    @State private var images: [Int: UIImage] = [:]

    var body: some View {
        List(Contactts) { Contactt in
            HStack {
                Image(uiImage: images[Contactt.id] ?? UIImage())
                    .resizable()
                    .frame(width: 40, height: 40)
                    .clipShape(Circle())
                Text(Contactt.name)
            }
            .onAppear {
                loadAvatar(for: Contactt)
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
    ContacttList()
}
