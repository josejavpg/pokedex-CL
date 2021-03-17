//
//  PokemonListRow.swift
//  Pokedex-CL
//
//  Created by Jose Javier Pabon Granados on 17/03/21.
//

import SwiftUI
import PokedexCLCore

struct PokemonGenerationListRow: View {
    @Binding var pokemons: [PKPreview]
    @State var title: String
    
    private let gridItems = [GridItem(.fixed(170), spacing:20), GridItem(.fixed(170), spacing:20)]
    var body: some View {
        VStack(alignment: .leading) {
            
            Text(title)
                .font(.headline)
            ScrollView(.horizontal) {
                LazyHGrid(rows: gridItems, spacing: 20) {
                    ForEach(pokemons) { pokemon in
                        PokemonCellView(pokemon: pokemon)
                    }
                }
            }
        }
    }
}
