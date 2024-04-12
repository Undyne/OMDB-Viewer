//
//  ContentView.swift
//  OMDB Viewer
//
//  Created by Greg Rodrigues on 2024-04-11.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundStyle(.tint)
                Text("Hello, world!")
            }
            .padding()
            .navigationBarTitle("OMDb Movie Database", displayMode: .inline)
        }
    }
}

#Preview {
    ContentView()
}
