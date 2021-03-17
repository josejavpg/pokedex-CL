//
//  PokemonViewModel.swift
//  Pokedex-CL
//
//  Created by Jose Javier Pabon Granados on 15/03/21.
//

import Foundation
import PokedexCLCore
import Combine

enum PKGeneration: Int, CaseIterable {
    case first = 1
    case second = 2
    case third = 3
    case fourth = 4
}

extension PKGeneration {
    var limit: Int {
        switch self {
        case .first:
            return 151
        case .second:
            return 100
        case .third:
            return 135
        case .fourth:
            return 107
        }
    }
    
    var offset: Int {
        switch self {
        case .first:
            return 0
        case .second:
            return Self.first.rawValue
        case .third:
            return Self.second.rawValue
        case .fourth:
            return Self.third.rawValue
        }
    }
}

class PokemonListViewModel: ObservableObject {
    @Published var pkFirstGen = [PKResult]()
    @Published var pkSecondGen = [PKResult]()
    @Published var pkThirdtGen = [PKResult]()
    @Published var pkFourthGen = [PKResult]()
    
    init(generations: [PKGeneration]) {
        _ = generations.map{ fetchPokemonList(by: $0) }
    }
}

extension PokemonListViewModel {
    func fetchPokemonList(by generation: PKGeneration) {
        
        PokedexService.share.fetchPokemonList(generation.limit, generation.offset) { pkResults, error in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            guard let pkResults = pkResults else { return  }
            DispatchQueue.main.async {
                switch generation {
                case .first:
                    return  self.pkFirstGen = pkResults
                case .second:
                    return  self.pkSecondGen = pkResults
                case .third:
                    return  self.pkThirdtGen = pkResults
                case .fourth:
                    return  self.pkFourthGen = pkResults
                }
            }
            
            
            
            
        }
    }
}
