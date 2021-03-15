// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let generation = try? newJSONDecoder().decode(Generation.self, from: jsonData)

import Foundation

// MARK: - Generation
struct Generation: Codable {
    let id: Int
    let name: String
    let pokemonSpecies: [PokemonSpecy]

    enum CodingKeys: String, CodingKey {
        case id, name
        case pokemonSpecies = "pokemon_species"
    }
}

// MARK: - PokemonSpecy
struct PokemonSpecy: Codable {
    let name: String
    let url: String
}
