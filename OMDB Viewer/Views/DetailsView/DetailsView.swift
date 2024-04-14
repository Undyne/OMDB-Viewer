//
//  DetailsView.swift
//  OMDB Viewer
//
//  Created by Greg Rodrigues on 2024-04-13.
//

import SwiftUI
import SDWebImageSwiftUI

struct DetailsView: View {
    
    @StateObject var viewModel: DetailsViewModel
    
    var body: some View {
        ScrollView(.vertical) {
            VStack(alignment: .leading, spacing: 0) {
                posterAndTitleView
                ratingAndCastView
                plotAndRegionView
                reviewsView
                Spacer()
            }
            .padding(.horizontal)
        }
    }
    
    var posterAndTitleView: some View {
        VStack(alignment: .leading, spacing: 10) {
            if let poster = viewModel.poster {
                WebImage(url: URL(string: poster))
                    .resizable()
                    .indicator(.activity)
                    .scaledToFit()
            }
            
            Text(viewModel.title)
                .bold()
                .font(.headline)
            if let year = viewModel.year {
                Text("Year: \(year)")
            }
            
        }
    }
    
    var ratingAndCastView: some View {
        VStack(alignment: .leading, spacing: 10) {
            if let rated = viewModel.rated {
                Text("Rated: \(rated)")
            }
            
            if let released = viewModel.released {
                Text("Release Date: \(released)")
            }

            if let runtime = viewModel.runtime {
                Text("Runtime: \(runtime)")
            }
            if let genre = viewModel.genre {
                HStack(alignment: .top, spacing: 8) {
                    Text("Genre:")
                    Text(genre)
                }
            }
            
            if let director = viewModel.director {
                Text("Director: \(director)")
            }
            if let writer = viewModel.writer {
                HStack(alignment: .top, spacing: 8) {
                    Text("Writer:")
                    Text(writer)
                }
            }
            if let actors = viewModel.actors {
                HStack(alignment: .top, spacing: 8) {
                    Text("Actors:")
                    Text(actors)
                }
            }
        }
    }
    
    var plotAndRegionView: some View {
        VStack(alignment: .leading, spacing: 10) {
            if let plot = viewModel.plot {
                HStack(alignment: .top, spacing: 8) {
                    Text("Plot:")
                    Text(plot)
                }
            }
            if let language = viewModel.language {
                Text("Language: \(language)")
            }
            if let country = viewModel.country {
                Text("Country: \(country)")
            }
        }
    }
    
    var reviewsView: some View {
        VStack(alignment: .leading, spacing: 10) {
            if let ratings = viewModel.ratings {
                ForEach(ratings, id: \.self) { rating in
                    HStack() {
                        Text("\(rating.source):")
                        Spacer()
                        Text("\(rating.value)")
                    }
                }
            } else if let rating = viewModel.imdbRating {
                Text("Internet Movie Database:")
                Spacer()
                Text("\(rating)")
            }
            
            if let boxOffice = viewModel.boxOffice {
                Text("Box Office Income: \(boxOffice)")
            }
            
            if let dvd = viewModel.dvd {
                Text("DVD Release Date: \(dvd)")
            }

        }
    }
}

#Preview {
    DetailsView(viewModel: DetailsViewModel(searchResult: .sharedSearchExample))
}
