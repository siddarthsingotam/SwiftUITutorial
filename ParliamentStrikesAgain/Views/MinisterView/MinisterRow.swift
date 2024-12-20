//
//  MinisterRow.swift
//  ParliamentStrikesAgain
//
//  Created by Siddarth Singotam on 8.11.2024.
//

import SwiftUI

struct MinisterRow: View {
    var minister: Minister
    
    var body: some View {
        HStack {
            minister.image
                .resizable()
                .scaledToFit()
                .frame(width:50, height:50)
            Text(" " + minister.first + " " + minister.last)
            
            Spacer()
            
            if minister.isFavorite {
                Image(systemName: "star.fill")
                    .foregroundStyle(.yellow)
                    
            }
        }
    }
}

#Preview {
    let ministers = ModelData().ministers
    return Group {
        MinisterRow(minister: ministers[1])
    }
}
