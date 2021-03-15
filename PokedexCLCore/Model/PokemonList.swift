// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let pokemonList = try? newJSONDecoder().decode(PokemonList.self, from: jsonData)

import Foundation

// MARK: - PokemonList
struct PokemonList: Codable {
    let results: [PKResult]
}

// MARK: - Result
struct PKResult: Codable {
    let name: String
    let url: String
    lazy var id: Int = {
        return getId(from: self.url)
    }()
    
    func getId(from url: String) -> Int {
        let strArray = url.components(separatedBy: "/")
        guard let idString = strArray.last else { return 0 }
        return Int(idString) ?? 0
    }
}

