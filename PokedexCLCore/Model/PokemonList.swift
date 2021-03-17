// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let pokemonList = try? newJSONDecoder().decode(PokemonList.self, from: jsonData)

import Foundation

// MARK: - PokemonList
public struct PokemonList: Codable {
    public let results: [PKResult]?
}

// MARK: - Result
public struct PKResult: Codable, Identifiable {
    public let name: String
    public let url: String
    public var id = UUID()
    
    enum CodingKeys: String, CodingKey {
            case name
            case url
        }
//    public func getId(from url: String) -> Int {
//        let strArray = url.components(separatedBy: "/")
//        guard let idString = strArray.last else { return 0 }
//        return Int(idString) ?? 0
//    }
}

