//
//  CategoryItem.swift
//  ParliamentStrikesAgain
//
//  Created by Siddarth Singotam on 15.11.2024.
//

import SwiftUI

struct CategoryItem: View {
    var minister: Minister
    
    var body: some View {
        VStack {
            minister.image
                .renderingMode(.original)
                .resizable()
                .frame(width: 150, height: 150)
                .cornerRadius(5)
                .shadow(radius: 1)
            Text(minister.first + " " + minister.last)
                .foregroundStyle(.primary)
                .font(.system(size: 16))
        }
        .padding(.leading, 15)
    }
}

#Preview {
    CategoryItem(minister: ModelData().ministers[0])
}
