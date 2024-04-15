//
//  SearchListView.swift
//  OMDB Viewer
//
//  Created by Greg Rodrigues on 2024-04-11.
//

import SwiftUI

struct SearchListView: View {
    
    @StateObject var viewModel = SearchListViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                TextField("Search", text: $viewModel.searchTerm)
                    .lineLimit(1)
                    .textFieldStyle(.roundedBorder)
                    .showClearButton($viewModel.searchTerm)
                    .padding(.all, 10)
                
                containedView()
                    .clipped()
                
                Spacer(minLength: 0)
            }
            .padding(.horizontal)
            .navigationBarTitle("OMDb Movie Database", displayMode: .inline)
        }
    }
    
    func containedView() -> AnyView {
        if viewModel.state == .loading && viewModel.results.isEmpty {
            AnyView(LoadingView())
        } else if viewModel.results.isEmpty {
            AnyView(emptyList)
        } else {
            AnyView(list)
        }
    }
    
    var emptyList: some View {
        VStack(alignment: .center) {
            Spacer()
            Text("No movies found")
            Spacer()
        }
    }
    
    var list: some View {
        ScrollView(.vertical) {
            LazyVStack {
                ForEach(viewModel.results, id:\.self) { movie in
                    NavigationLink(destination: DetailsView(viewModel: DetailsViewModel(searchResult: movie))) {
                        SearchListCellView(movie: movie)
                            .onAppear() {
                                if movie.imdbID == viewModel.results.last?.imdbID {
                                    viewModel.loadNextPage()
                                }
                            }

                    }
                }
            }
        }
    }
}

#Preview {
    SearchListView()
}
