//
//  NewsDetailView.swift
//  ListWithCombine
//
//  Created by Vinod Achuthankutty on 21/1/23.
//

import Foundation
import SwiftUI

struct NewsDetailView: View {
    var item: NewsItem
//        init(viewModel: ApiViewModel) {
//            self.viewModel = viewModel
////            print("Hello\(viewModel.selectedNews!)")
//        }
    var body: some View {
        VStack(alignment: .leading) {
            Text(item.title)
                .font(.headline)
            Text(item.author)
                .font(.subheadline)
            Text(item.date)
                .font(.subheadline)
            Text(item.content)
                .padding(.top, 8)
            ImageView(withURL: item.imageUrl ?? "")
                .frame(height: 200)
                .padding(.top, 8)
            HStack {
                Text("Read more")
                    .onTapGesture {
                        UIApplication.shared.open((URL(string: item.readMoreUrl ?? "http://www.google.com") ?? URL(string: "https://www.google.com"))!)
                    }
                Spacer()
                Text("Article link")
                    .onTapGesture {
                        UIApplication.shared.open(URL(string: item.url)!)
                    }
            }
            .padding(.top, 8)
        }
        .padding()
    }
}
