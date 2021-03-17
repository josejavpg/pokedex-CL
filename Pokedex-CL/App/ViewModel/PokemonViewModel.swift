//
//  PokemonViewModel.swift
//  Pokedex-CL
//
//  Created by Jose Javier Pabon Granados on 15/03/21.
//

import Foundation
import PokedexCLCore
import SwiftUI

enum PKGeneration: Int, CaseIterable {
    case first = 1
    case second = 2
    case third = 3
    case fourth = 4
}

extension PKGeneration {
    var title: String {
        switch self {
        case .first:
            return "First Generation"
        case .second:
            return "Second Generation"
        case .third:
            return "Third Generation"
        case .fourth:
            return "Fourth Generation"
        }
    }
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
            return Self.first.limit
        case .third:
            return Self.first.limit + Self.second.limit
        case .fourth:
            return Self.first.limit + Self.second.limit + Self.third.limit
        }
    }
    
    var color: Color {
        switch self {
        case .first:
            return .blue
        case .second:
            return .red
        case .third:
            return .green
        case .fourth:
            return .yellow
        }
    }
}

class PokemonListViewModel: ObservableObject {
    @Published var pkFirstGen = [PKPreview]()
    @Published var pkSecondGen = [PKPreview]()
    @Published var pkThirdtGen = [PKPreview]()
    @Published var pkFourthGen = [PKPreview]()
    
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
            let pkPreviewList = pkResults.map { PKPreview(id: $0.getId(from: $0.url), name: $0.name, url: $0.url)}
            DispatchQueue.main.async {
                switch generation {
                case .first:
                    return  self.pkFirstGen = pkPreviewList
                case .second:
                    return  self.pkSecondGen = pkPreviewList
                case .third:
                    return  self.pkThirdtGen = pkPreviewList
                case .fourth:
                    return  self.pkFourthGen = pkPreviewList
                }
            }
            
            
            
            
        }
    }
}
