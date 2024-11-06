//
//  LandmarkList.swift
//  Landmarks
//
//  Created by Siddarth Singotam on 6.11.2024.
//

import SwiftUI

struct LandmarkList: View {
    var body: some View {
        List(landmarks, id: \.id){ landmark in
            LandmarkRow(landmark: landmark)
        }

    }
}

#Preview {
    LandmarkList()
}
