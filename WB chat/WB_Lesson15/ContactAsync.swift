////
////  ContactAsync.swift
////  WB chat
////
////  Created by Sergey Savinkov on 31.07.2024.
////
//import SwiftUI
//import Combine
//
//class ImageLoader {
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
//struct Contact: Identifiable {
//    let id = UUID()
//    let name: String
//    let avatarUrl: URL
//}
//
//struct ContactRoww: View {
//    let contact: Contact
//    @StateObject var imageLoader = ImageLoader(url: URL(string: "https://example.com/avatar.jpg")!)
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
//            Text(contact.name)
//        }
//    }
//}
//
//struct ContactList: View {
//    let contacts: [Contact] = [
//        Contact(name: "John Doe", avatarUrl: URL(string: "https://example.com/john.jpg")!),
//        Contact(name: "Jane Doe", avatarUrl: URL(string: "https://example.com/jane.jpg")!),
//        // ...
//    ]
//
//    var body: some View {
//        List(contacts) { contact in
//            ContactRow(contact: contact)
//        }
//    }
//}
