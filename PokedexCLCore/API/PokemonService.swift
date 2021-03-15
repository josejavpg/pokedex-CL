//
//  PokemonService.swift
//  PokedexCLCore
//
//  Created by Jose Javier Pabon Granados on 15/03/21.
//

import Foundation

class PokedexService {
    
    let defaultSession: URLSession = .shared
    var dataTask: URLSessionDataTask?
        
    func fetchPokemon(with id: Int, completion: @escaping (Pokemon?, Error?) -> Void) {
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
    
    func fetchPokemonList(_ limit: Int, _ offset: Int, completion: @escaping ([Pokemon]?, Error?) -> Void) {
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
                let pokemonList = try decoder.decode([Pokemon].self, from: data)
                completion(pokemonList, nil)
            } catch let er as NSError {
                completion(nil, er)
            }

        }
    }
    
    func fetchPokemonList(from generation: Int, completion: @escaping (PokemonList?, Error?) -> Void) {
        let endpoint = Endpoint.pokemonsByGeneration(id: generation)
        
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
                completion(pokemonList, nil)
            } catch let er as NSError {
                completion(nil, er)
            }

        }
    }
    
//    func fetchMovieDetails(using id: Int, completion: @escaping (Pokemon?) -> Void) {
//        defaultSession.request(.detail(id: id)) { [weak self] data, response, error in
//            defer {
//                self?.dataTask = nil
//            }
//
//            if let error = error {
//                self?.errorMessage += "DataTask error: " + error.localizedDescription + "\n"
//            } else if let data = data {
//
//                do {
//                    let decoder = JSONDecoder()
//                    let movie = try decoder.decode(Movie.self, from: data)
//
//                    DispatchQueue.main.async {
//                        completion(movie)
//                    }
//                } catch let er as NSError {
//                    print(er.localizedDescription)
//                  return
//                }
//
//            }
//        }
//    }
}
