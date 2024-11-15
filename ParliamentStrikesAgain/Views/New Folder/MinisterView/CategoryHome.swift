//
//  CategoryHome.swift
//  ParliamentStrikesAgain
//
//  Created by Siddarth Singotam on 15.11.2024.
//

import SwiftUI

struct CategoryHome: View {
    @Environment(ModelData.self) var modelData

    var body: some View {
        NavigationSplitView {
            List {
        
                ForEach(modelData.categories.keys.sorted(), id: \.self) { key in
                    CategoryRow(categoryName: key, items: modelData.categories[key]!)
                }
                .listRowInsets(EdgeInsets())
            }
            .navigationTitle("Featured")
        } detail: {
            Text("Select a party")
        }
    }
}

#Preview {
    CategoryHome()
        .environment(ModelData())
}
