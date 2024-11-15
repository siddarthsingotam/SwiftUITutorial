//
//  MinisterDetail.swift
//  ParliamentStrikesAgain
//
//  Created by Siddarth Singotam on 8.11.2024.
//

import SwiftUI

struct MinisterDetail: View {
    @Environment(ModelData.self) var modelData
    var minister: Minister

    var ministerIndex: Int {
        modelData.ministers.firstIndex(where: { $0.id == minister.id })!
    }

    var body: some View {
        @Bindable var modelData = modelData
        
        ScrollView {
            ShapeImage(image: minister.image)
                .offset(y: 130)
                .padding(.bottom, 150)
            
            
            VStack(alignment: .leading) {
                HStack {
                    Text(minister.first)
                        .font(.title)
                    Text(minister.last)
                        .font(.title)
                    Divider()
                    FavoriteButton(isSet: $modelData.ministers[ministerIndex].isFavorite)
                }

                Divider()

                Text("Party: \( minister.party)")
                Text("Constituency: \(minister.constituency)")
                Text("Seat Number: \(minister.seatNumber)")
                Text("Born: \(minister.bornYear)")
                if !minister.twitter.isEmpty {
                    Text("Twitter: \(minister.twitter)")
                }
                if minister.minister {
                    Text("Minister: Yes")
                } else {
                    Text("Minister: No")
                }
            }.padding(50.0)
        }
    }
}

#Preview {
    let modelData = ModelData()
    MinisterDetail(minister: ModelData().ministers[0])
        .environment(modelData)
}
