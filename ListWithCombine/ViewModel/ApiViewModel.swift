//
//  ApiViewModel.swift
//  ListWithCombine
//
//  Created by Vinod Achuthankutty on 21/1/23.
//

import Foundation
import SwiftUI
import Combine

class ApiViewModel: ObservableObject {
    @Published var items = [NewsItem]()
    @Published var selectedCategory = ""
    @Published var error: String?
    @Published var isLoading = false
    @Published var selectedNews:NewsItem?
    var cancellables = Set<AnyCancellable>()
    let didFinishFetch = PassthroughSubject<Void, Never>()
    func setData(_ data: [NewsItem]) {
        print(data[0])
        self.items = data.map { $0.copy() }
        print(self.items[0])
    }
    
    func fetchData(for category: String) {
        self.selectedCategory = category
        let url = URL(string: "https://inshorts.deta.dev/news?category=\(category)")!
        URLSession.shared.dataTaskPublisher(for: url).print()
            .map { $0.data }
            .tryMap { data -> NewsItemParent in
                    do {
                        return try JSONDecoder().decode(NewsItemParent.self, from: data)
                    } catch let error {
                        print(error)
                        throw error
                    }
                }
            .map { $0.data }
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { _ in }, receiveValue: { data in
                self.setData(data)
                self.didFinishFetch.send()
            })
            .store(in: &cancellables)
    }
//    private var cancellables = Set<AnyCancellable>()
}
