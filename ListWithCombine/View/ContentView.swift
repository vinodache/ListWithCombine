//
//  ContentView.swift
//  ListWithCombine
//
//  Created by Vinod Achuthankutty on 21/1/23.
//

import SwiftUI
import Combine

struct ContentView: View {
    @ObservedObject var viewModel = ApiViewModel()
    @State private var showListScreen = false

    let categories = ["science", "business", "sports", "politics", "technology", "startup"]
    
    var body: some View {
        NavigationView {
            List {
                Text("Categories")
                    .font(.headline)
                ForEach(categories, id: \.self) { category in
                    Button(action: {
                        self.viewModel.fetchData(for: category)
                    }) {
                        Text(category)
                    }
                }
            }
            .navigationBarTitle("News Categories")
            }
            .sheet(isPresented: $showListScreen) {
                NewsListView(viewModel: self.viewModel)
            }
            .gesture(DragGesture().onChanged({_ in }))
            .onAppear {
                self.viewModel.didFinishFetch
                    .sink { _ in
                        self.showListScreen = true
                    }
                    .store(in: &self.viewModel.cancellables)
            }

        }
    }


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
