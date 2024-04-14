//
//  BlankPoster.swift
//  OMDB Viewer
//
//  Created by Greg Rodrigues on 2024-04-13.
//

import SwiftUI

struct BlankPoster: View {
    var body: some View {
        Image(systemName: "photo.artframe")
            .foregroundColor(.gray)
            .imageScale(.large)
            .frame(width: 70, height: 100)
            .overlay(
                RoundedRectangle(cornerRadius: 5)
                    .stroke(.gray, lineWidth: 1)
            )
    }
}

#Preview {
    BlankPoster()
}
