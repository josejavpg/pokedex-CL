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
public struct PKResult: Codable {
    public let name: String
    public let url: String
    
    public func getId(from url: String) -> String {
        let strArray = url.components(separatedBy: "/")
        guard strArray.count > 1 else { return "0" }
        let idIndex = strArray.endIndex - 2
        let idString = strArray[idIndex]
        return idString
    }
}

public struct PKPreview: Identifiable {
    public init(id: String, name: String, url: String) {
        self.id = id
        self.name = name
        self.url = url
    }
    
    public let id: String
    public let name: String
    public let url: String
}

