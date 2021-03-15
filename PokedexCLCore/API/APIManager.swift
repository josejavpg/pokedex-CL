//
//  APIManager.swift
//  PokedexCLCore
//
//  Created by Jose Javier Pabon Granados on 15/03/21.
//

class APIManager {
    static let shared = APIManager()
}


private extension URL {
    static func makeForEndpoint(_ endpoint: String) -> URL {
        URL(string: "https://pokeapi.co/api/v2/")!
    }
}

enum Endpoint {
    case move(id: Int)
    case pokemon(id: Int)
    case pokemonList(limit: Int, offset: Int)
}

extension Endpoint {
    var url: URL {
        switch self {
        case .move(let id):
            return .makeForEndpoint("move/\(id)?")
        case .pokemon(let id):
            return .makeForEndpoint("pokemon/\(id)")
        case .pokemonList(let limit, let offset):
            return .makeForEndpoint("pokemon?limit=\(limit)&offset=\(offset)")
        }
    }
}

extension URLSession {
    typealias Handler = (Data?, URLResponse?, Error?) -> Void
    
    @discardableResult
    func request(
        _ endpoint: Endpoint,
        then handler: @escaping Handler
    ) -> URLSessionDataTask {
        let task = dataTask(
            with: endpoint.url,
            completionHandler: handler
        )
        
        task.resume()
        return task
    }
}

