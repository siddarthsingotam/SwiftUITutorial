//
//  ModelData.swift
//  ParliamentStrikesAgain
//
//  Created by Siddarth Singotam on 8.11.2024.
//

//import Foundation
//
//@Observable
//class ModelData {
//    var ministers: [Minister] = load("mps.json")
//    
//    var features: [Minister] {
//        ministers.filter { $0.isFeatured }
//    }
//    
//    var categories: [String: [Minister]]{
//        Dictionary(
//            grouping: ministers,
//            by: { $0.category.rawValue }
//        )
//    }
//}
//
//func load<T: Decodable>(_ filename: String) -> T {
//    let data: Data
//
//
//    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
//    else {
//        fatalError("Couldn't find \(filename) in main bundle.")
//    }
//
//
//    do {
//        data = try Data(contentsOf: file)
//    } catch {
//        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
//    }
//
//
//    do {
//        let decoder = JSONDecoder()
//        return try decoder.decode(T.self, from: data)
//    } catch {
//        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
//    }
//}

//import Foundation
//
//@Observable
//class ModelData {
//    @Published var ministers: [Minister] = []
//    
//    var features: [Minister] {
//        ministers.filter { $0.isFeatured }
//    }
//    
//    var categories: [String: [Minister]] {
//        Dictionary(
//            grouping: ministers,
//            by: { $0.category.rawValue }
//        )
//    }
//    
//    init() {
//        fetchMinisters()
//    }
//    
//    /// Fetches ministers' data from the network
//    func fetchMinisters() {
//        guard let url = URL(string: "https://users.metropolia.fi/~peterh/mps.json") else {
//            fatalError("Invalid URL")
//        }
//        
//        URLSession.shared.dataTask(with: url) { data, response, error in
//            if let error = error {
//                print("Failed to fetch data: \(error.localizedDescription)")
//                return
//            }
//            
//            guard let data = data else {
//                print("No data received")
//                return
//            }
//            
//            do {
//                let decoder = JSONDecoder()
//                let ministers = try decoder.decode([Minister].self, from: data)
//                DispatchQueue.main.async {
//                    self.ministers = ministers
//                }
//            } catch {
//                print("Failed to decode JSON: \(error.localizedDescription)")
//            }
//        }.resume()
//    }
//}

import Foundation
import Observation

@Observable
@MainActor // Ensures that all updates are handled on the main thread
class ModelData {
    var ministers: [Minister] = []
    
    var features: [Minister] {
        ministers.filter { $0.isFeatured }
    }
    
    var categories: [String: [Minister]] {
        Dictionary(
            grouping: ministers,
            by: { $0.category.rawValue }
        )
    }
    
    init() {
        loadData()
    }
    
    private func loadData() {
        guard let url = URL(string: "https://users.metropolia.fi/~peterh/mps.json") else {
            fatalError("Invalid URL")
        }
        
        Task {
            do {
                let (data, _) = try await URLSession.shared.data(from: url)
                let decoder = JSONDecoder()
                self.ministers = try decoder.decode([Minister].self, from: data)
            } catch {
                print("Error loading data: \(error)")
            }
        }
    }
}




