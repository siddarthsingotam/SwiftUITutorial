//
//  Landmark.swift
//  Landmarks
//
//  Created by Siddarth Singotam on 6.11.2024.
//

import CoreLocation
import Foundation
import SwiftUI

struct Landmark: Hashable, Codable {
    var id: Int
    var name: String
    var state: String
    var description: String

    private var imageName: String
    var image: Image {
        Image(imageName)
    }

    private var coordinates: Coordinates
    var locationCorordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: <#T##CLLocationDegrees#>,
            longitude: <#T##CLLocationDegrees#>)
    }

    struct Coordinates: Hashable, Codable {
        var latitude: Double
        var longitude: Double
    }

}
