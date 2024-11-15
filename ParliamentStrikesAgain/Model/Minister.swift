//
//  Minister.swift
//  ParliamentStrikesAgain
//
//  Created by Siddarth Singotam on 8.11.2024.
//

import Foundation
import SwiftUI

struct Minister: Hashable, Codable, Identifiable {
    let id: Int
    let seatNumber: Int
    let last: String
    let first: String
    let party: String
    let minister: Bool
    let picture: String
    let bornYear: Int
    let constituency: String
    let twitter: String
    
    
    var image: Image {
        Image(party)
    }
    
    var isFavorite: Bool = false
    var isFeatured: Bool = false
    
    
    var category: Category {
        Category(rawValue: party) ?? .unknown
    }
    enum Category: String, CaseIterable, Codable {
        case sd = "sd"
        case kesk = "kesk"
        case ps = "ps"
        case kok = "kok"
        case vas = "vas"
        case r = "r"
        case kd = "kd"
        case liik = "liik"
        case vihr = "vihr"
        case unknown = "unknown"
    }
    
    
    
    enum CodingKeys: String, CodingKey {
        case id = "personNumber"
        case seatNumber
        case last
        case first
        case party
        case minister
        case picture
        case bornYear
        case constituency
        case twitter
    }
    
}
