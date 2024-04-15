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
            VStack(alignment: .leading, spacing: 10) {
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
            separatedTextView("Year:", viewModel.year)

        }
    }
    
    var ratingAndCastView: some View {
        VStack(alignment: .leading, spacing: 10) {
            separatedTextView("Rated:", viewModel.rated)
            separatedTextView("Release Date:", viewModel.released)
            separatedTextView("Runtime:", viewModel.runtime)
            separatedTextView("Genre:", viewModel.genre)
            separatedTextView("Director:", viewModel.director)
            separatedTextView("Writer:", viewModel.writer)
            separatedTextView("Actors:", viewModel.actors)
        }
    }
    
    var plotAndRegionView: some View {
        VStack(alignment: .leading, spacing: 10) {
            separatedTextView("Plot:", viewModel.plot)
            separatedTextView("Language:", viewModel.language)
            separatedTextView("Country:", viewModel.country)
        }
    }
    
    var reviewsView: some View {
        VStack(alignment: .leading, spacing: 10) {
            if let ratings = viewModel.ratings {
                ForEach(ratings, id: \.self) { rating in
                    separatedTextView("\(rating.source):", rating.value)
                }
            } else if let rating = viewModel.imdbRating {
                separatedTextView("Internet Movie Database:", rating)
            }
            
            separatedTextView("Box Office Income:", viewModel.boxOffice)
            separatedTextView("DVD Release Date:", viewModel.dvd)
        }
    }
    
    @ViewBuilder func separatedTextView(_ leading: String, _ trailing: String?) -> some View {
        if let trailing = trailing,
           trailing != "N/A" {
            HStack(alignment: .top, spacing: 8) {
                Text(leading)
                Spacer()
                Text(trailing)
                    .multilineTextAlignment(.trailing)
            }
        } else {
            EmptyView()
        }
    }
}

#Preview {
    DetailsView(viewModel: DetailsViewModel(searchResult: .sharedSearchExample))
}
