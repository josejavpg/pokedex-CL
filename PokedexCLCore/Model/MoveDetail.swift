// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let move = try? newJSONDecoder().decode(Move.self, from: jsonData)

import Foundation

// MARK: - Move
struct MoveDetail: Codable {
    let id: Int
    let name: String
    let power, pp: Int
    let type: TypeClass
}

// MARK: - TypeClass
struct TypeClass: Codable {
    let name: String
    let url: String
}
