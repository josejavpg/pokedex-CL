//
//  PokemonService.swift
//  PokedexCLCore
//
//  Created by Jose Javier Pabon Granados on 15/03/21.
//

import Foundation

public class PokedexService {
    public static var share = PokedexService()
    private let defaultSession: URLSession = .shared
    private var dataTask: URLSessionDataTask?
        
    public func fetchPokemon(with id: String, completion: @escaping (Pokemon?, Error?) -> Void) {
        let endpoint = Endpoint.pokemon(id: id)
        dataTask?.cancel()
        
        defaultSession.request(endpoint)  { [weak self] data, response, error in
            defer {
                self?.dataTask = nil
            }
            
            if let error = error {
                completion(nil, error)
            }
            guard let data = data else { fatalError() }

            do {
                let decoder = JSONDecoder()
                let pokemon = try decoder.decode(Pokemon.self, from: data)
                completion(pokemon, nil)
            } catch let er as NSError {
                completion(nil, er)
            }

        }
    }
    
    public func fetchPokemonDetail(with url: String, completion: @escaping (Pokemon?, Error?) -> Void) {
        let endpoint = Endpoint.pokemonDetail(url: url)
        dataTask?.cancel()
        
        defaultSession.request(endpoint)  { [weak self] data, response, error in
            defer {
                self?.dataTask = nil
            }
            
            if let error = error {
                completion(nil, error)
            }
            guard let data = data else { fatalError() }

            do {
                let decoder = JSONDecoder()
                let pokemon = try decoder.decode(Pokemon.self, from: data)
                completion(pokemon, nil)
            } catch let er as NSError {
                completion(nil, er)
            }

        }
    }
    
    public func fetchPokemonList(_ limit: Int, _ offset: Int, completion: @escaping ([PKResult]?, Error?) -> Void) {
        let endpoint = Endpoint.pokemonList(limit: limit, offset: offset)
        
        dataTask?.cancel()
        
        defaultSession.request(endpoint)  { [weak self] data, response, error in
            defer {
                self?.dataTask = nil
            }
            
            if let error = error {
                completion(nil, error)
            }
            guard let data = data else { fatalError() }

            do {
                let decoder = JSONDecoder()
                let pokemonList = try decoder.decode(PokemonList.self, from: data)
                let pkList = pokemonList.results
                completion(pkList, nil)
            } catch let er as NSError {
                completion(nil, er)
            }
        }
    }
}
