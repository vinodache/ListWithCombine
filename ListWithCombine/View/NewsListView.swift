//
//  NewsListView.swift
//  ListWithCombine
//
//  Created by Vinod Achuthankutty on 21/1/23.
//

import Foundation
import SwiftUI

struct NewsListView: View {
    @ObservedObject var viewModel: ApiViewModel
        init(viewModel: ApiViewModel) {
            self.viewModel = viewModel
            print("Hello\(viewModel.items)")
        }
    var body: some View {
        NavigationView {
        List(viewModel.items, id:\.id) { item in
            NavigationLink(destination: NewsDetailView(item:item)){
                VStack(alignment: .leading) {
                    Text(item.title)
                        .font(.headline)
                    Text(item.author)
                        .font(.subheadline)
                    Text(item.date)
                        .font(.subheadline)
                }
            }
        }
        .navigationBarTitle("News")
    }
    }
}

