//
//  CatsListView.swift
//  4IT532-project
//
//  Created by Jan Podestát on 01.06.2023.
//

import SwiftUI

struct CatsListView: View {
    @StateObject var viewModel = CatListViewModel()
    
    func createBody() -> some View {
        LazyVStack(alignment: .leading, spacing: 12) {
            ForEach(viewModel.cats) { cat in
                NavigationLink(destination: CatDetailView(cat: cat)) {
                    CatsListItemView(cat: cat)
                }
            }
        }
        .padding(.horizontal, 16)
    }
    
    
    var body: some View {
        ZStack {
            ScrollView {
                switch viewModel.state {
                case .initial, .loading:
                    ProgressView()
                case .fetched:
                    createBody()
                case .failed:
                    Text("Something went wrong 😕")
                }
            }
        }
        .navigationTitle("Cats")
        .onFirstAppear {
            Task {
                await viewModel.load()
            }
        }
    }
}

struct CatsListView_Previews: PreviewProvider {
    static var previews: some View {
        CatsListView()
    }
}
