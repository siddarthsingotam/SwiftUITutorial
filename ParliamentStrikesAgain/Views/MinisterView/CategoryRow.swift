//
//  CategoryRow.swift
//  ParliamentStrikesAgain
//
//  Created by Siddarth Singotam on 15.11.2024.
//

import SwiftUI

struct CategoryRow: View {
    var categoryName: String
    var items: [Minister]
    
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(categoryName)
                .font(.headline)
                .padding(.leading, 15)
                .padding(.top, 5)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: 0) {
                    ForEach(items) { minister in
                        NavigationLink{
                            MinisterDetail(minister: minister)
                        } label: {
                            CategoryItem(minister: minister)
                        }
                    }
                }
            }
            .frame(height: 185)
        }
    }
}

#Preview {
    let ministers = ModelData().ministers
    return CategoryRow(
        categoryName: ministers[0].category.rawValue,
        items: Array(ministers.prefix(4))
    )
    
}
