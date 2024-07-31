//
//  ContactModel.swift
//  WB chat
//
//  Created by Sergey Savinkov on 01.08.2024.
//

import Foundation

struct Contactt: Identifiable {
    let id: Int
    let name: String
    let avatarURL: URL
}

var contactData: [Contactt] = [
    Contactt(id: 1, name: "John", avatarURL: URL(string: "https://avatars.mds.yandex.net/i?id=1cf04a6f38f0be15415a0c35010d27a33267ef19-4589186-images-thumbs&n=13")!),
    Contactt(id: 2, name: "Jane", avatarURL: URL(string: "https://avatars.mds.yandex.net/i?id=b2189c4d8d0a9cffc9a98b6339ff1e76c190205c-10415036-images-thumbs&n=13")!),
    Contactt(id: 3, name: "Jack", avatarURL: URL(string: "https://avatars.mds.yandex.net/i?id=2ad00f6d6da86c36477f9a86aefc02102eb08fd0-4984230-images-thumbs&n=13")!),
    Contactt(id: 4, name: "Ron", avatarURL: URL(string: "https://avatars.mds.yandex.net/i?id=447909d704697c96f2d7114c4eee8f4ce430f34a-4073140-images-thumbs&n=13")!),
    Contactt(id: 5, name: "Oleg", avatarURL: URL(string: "https://avatars.mds.yandex.net/i?id=ea1710c26df9dd63c076d4d2ca4fb119f9494222-5235531-images-thumbs&n=13")!),
    Contactt(id: 6, name: "Alex", avatarURL: URL(string: "https://avatars.mds.yandex.net/i?id=497ce6baa4c4d9839b1cb771cbb2e6b1cf6e9ee1-5339847-images-thumbs&n=13")!),
]
