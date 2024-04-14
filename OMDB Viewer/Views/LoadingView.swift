//
//  LoadingView.swift
//  OMDB Viewer
//
//  Created by Greg Rodrigues on 2024-04-13.
//

import SwiftUI


struct LoadingView: View {
    
    var body: some View {
        VStack() {
            Spacer()
            HStack(spacing: 8) {
                Spacer()
                ProgressView()
                Text("Loading...")
                Spacer()
            }
            Spacer()
        }
    }
}

#Preview {
    LoadingView()
}
