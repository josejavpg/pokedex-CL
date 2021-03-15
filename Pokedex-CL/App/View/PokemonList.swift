//
//  ContentView.swift
//  Pokedex-CL
//
//  Created by Jose Javier Pabon Granados on 13/03/21.
//

import SwiftUI

struct PokemonList: View {
    private let gridItems = [GridItem(.flexible()), GridItem(.flexible())]
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: gridItems, spacing: 16) {
                    ForEach(0..<100) { _ in
                        PokemonCellView()
                    }
                }
            }
            .navigationTitle("Pokemon")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonList()
    }
}
