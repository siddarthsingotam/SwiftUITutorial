//
//  ShapeImage.swift
//  ParliamentStrikesAgain
//
//  Created by Siddarth Singotam on 8.11.2024.
//

import SwiftUI

struct ShapeImage: View {
    var image: Image
    
    var body: some View {
        image
            .resizable().frame(width: 150, height: 150)
            .cornerRadius(20)
            .overlay{
                RoundedRectangle(cornerRadius:20).stroke(.white, lineWidth: 4)
            }
            .shadow(radius: 2)
    }
}

#Preview {
    ShapeImage(image: Image("kesk"))
}
