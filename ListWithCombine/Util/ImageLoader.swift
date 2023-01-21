//
//  ImageLoader.swift
//  ListWithCombine
//
//  Created by Vinod Achuthankutty on 21/1/23.
//

import Foundation
import Combine

// Helper class for loading images
class ImageLoader: ObservableObject {
    var didChange = PassthroughSubject<Data, Never>()
    var data = Data() {
        didSet {
            didChange.send(data)
        }
    }

    init(url: String) {
        guard let url = URL(string: url) else { return }
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            guard let data = data else { return }
            DispatchQueue.main.async {
                self.data = data
            }
        }
        .resume()
    }
}
