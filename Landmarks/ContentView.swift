//
//  ContentView.swift
//  Landmarks
//
//  Created by Siddarth Singotam on 4.11.2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Turtle Rock!")
                .font(.title)
            
            HStack {
                Text("Joshua tree National Park")
                    .font(.subheadline)
                Text("California")
                    .font(.subheadline)
            }
            
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
