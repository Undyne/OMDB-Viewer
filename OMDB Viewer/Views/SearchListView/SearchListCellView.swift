//
//  SearchListCellView.swift
//  OMDB Viewer
//
//  Created by Greg Rodrigues on 2024-04-11.
//

import SwiftUI
import SDWebImageSwiftUI

struct SearchListCellView: View {
    let movie: SearchResult
    @State var pressed: Bool = true
    
    var body: some View {
        HStack(alignment: .top) {
            
            if let poster = movie.poster {
                WebImage(url: URL(string: poster))
                    .resizable()
                    .indicator(.activity)
                    .scaledToFit()
                    .frame(width: 70, height: 100)
            } else {
                BlankPoster()
            }
            
            VStack(alignment: .leading, spacing: 10) {
                Text(movie.title)
                    .foregroundStyle(.black)
                    .font(.headline)
                Text("Released: \(movie.year)")
                    .foregroundStyle(.black)
                    .font(.body)
                
                Button(action: {
                    pressed.toggle()
                }, label: {
                    Image(systemName: pressed ? "hand.thumbsup" : "hand.thumbsup.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 20, height: 20)
                        .padding([.trailing, .bottom], 20)  // This is to increase the bounding box size of the button to 40x40
                })
                
            }
            Spacer()
        }
    }
}

#Preview {
    VStack {
        SearchListCellView(movie: SearchResult.sharedSearchExample)
    }
}
