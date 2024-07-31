////
////  ContactAsync.swift
////  WB chat
////
////  Created by Sergey Savinkov on 31.07.2024.
////
//import SwiftUI
//import Combine
//
//class ImageLoader: ObservableObject {
//    @Published var image: UIImage?
//    private let url: URL
//    private var cancellable: AnyCancellable?
//
//    init(url: URL) {
//        self.url = url
//        load()
//    }
//
//    private func load() {
//        cancellable = URLSession.shared.dataTaskPublisher(for: url)
//            .map { UIImage(data: $0.data) }
//            .replaceError(with: nil)
//            .sink { [weak self] image in
//                self?.image = image
//            }
//    }
//}
//
//struct ContactRoww: View {
//    let contact: Contact
//    @StateObject var imageLoader: ImageLoader
//
//    init(contact: Contact) {
//        self.contact = contact
//        if let avatar = contact.avatar {
//            _imageLoader = StateObject(wrappedValue: ImageLoader(url: URL(string: "https://avatars.mds.yandex.net/i?id=9045280b715298fb7b72fa6d88fe92c6_l-4519035-images-thumbs&n=13")!))
//        } else {
//            _imageLoader = StateObject(wrappedValue: ImageLoader(url: URL(string: "https://example.com/default.jpg")!))
//        }
//    }
//
//    var body: some View {
//        HStack {
//            if let image = imageLoader.image {
//                Image(uiImage: image)
//                    .resizable()
//                    .frame(width: 40, height: 40)
//                    .clipShape(Circle())
//            } else {
//                ProgressView()
//            }
//            VStack(alignment: .leading) {
//                Text(contact.name)
//                    .font(.headline)
//                Text(contact.initials)
//                    .foregroundColor(.secondary)
//            }
//        }
//    }
//}
//
//#Preview {
//    ContactRoww(contact: Contact(name: "Анастасия Иванова", initials: "АИ", isOnline: false, lastSeen: Date(timeIntervalSinceNow: -86400), avatar: "nastya", isHistory: true))
//}
