//
//  ImageLoader.swift
//  WB chat
//
//  Created by Sergey Savinkov on 01.08.2024.
//

import Foundation
import SwiftUI

class ImageLoader {
    let url: URL
    var image: UIImage?

    init(url: URL) {
        self.url = url
    }

    func load(completion: @escaping (UIImage?) -> Void) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Error loading image: \(error.localizedDescription)")
                completion(nil)
                return
            }

            guard let data = data else {
                completion(nil)
                return
            }
            DispatchQueue.main.async {
                let image = UIImage(data: data)
                completion(image)
            }
        }.resume()
    }
}
