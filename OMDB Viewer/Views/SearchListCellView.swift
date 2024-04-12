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
            WebImage(url: URL(string: movie.poster))
            .resizable()
            .indicator(.activity)
            .scaledToFit()
            .frame(width: 100, height: 150)

            VStack(alignment: .leading, spacing: 10) {
                Text(movie.title)
                    .bold()
                    .font(.title)
                Text("Released: \(movie.year)")
                    .font(.title3)

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
        .padding()
    }
}


#Preview {
    VStack {
        SearchListCellView(movie: SearchResult.sharedSearchExample)
    }
}
