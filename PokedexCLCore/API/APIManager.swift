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
        URL(string: "https://pokeapi.co/api/v2/\(endpoint)")!
    }
}

public enum Endpoint {
    case move(id: Int)
    case pokemon(id: String)
    case pokemonDetail(url: String)
    case pokemonsByGeneration(id: Int)
    case pokemonList(limit: Int, offset: Int)
}

extension Endpoint {
    public var url: URL {
        switch self {
        case .move(let id):
            return .makeForEndpoint("move/\(id)?")
        case .pokemon(let id):
            return .makeForEndpoint("pokemon/\(id)")
        case .pokemonsByGeneration(let id):
            return .makeForEndpoint("generation/\(id)")
        case .pokemonList(let limit, let offset):
            return .makeForEndpoint("pokemon?limit=\(limit)&offset=\(offset)")
        case .pokemonDetail(let url):
            return URL(string: url)!
        }
    }
}

extension URLSession {
    public typealias Handler = (Data?, URLResponse?, Error?) -> Void
    
    @discardableResult
    public func request(
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

