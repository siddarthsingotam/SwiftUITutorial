//
//  MinisterList.swift
//  ParliamentStrikesAgain
//
//  Created by Siddarth Singotam on 8.11.2024.
//

import SwiftUI

struct MinisterList: View {
    @Environment(ModelData.self) var modelData
    @State private var showFavoritesOnly = false
    
    var filteredMinisters: [Minister] {
        modelData.ministers.filter { minister in
            (!showFavoritesOnly || minister.isFavorite)
        }
    }
    
    var body: some View {
        NavigationSplitView {
            List {
                Toggle(isOn: $showFavoritesOnly) {
                    Text("Favorites only")
                }
                
                ForEach(filteredMinisters){ minister in
                    NavigationLink{
                        MinisterDetail(minister: minister)
                    } label: {
                        MinisterRow(minister: minister)
                    }
                }
            }
            .animation(.default, value: filteredMinisters)
            .navigationTitle("Minister List")
        } detail: {
            Text("Select Minister")
        }
    }
}

#Preview {
    MinisterList()
        .environment(ModelData())
}
