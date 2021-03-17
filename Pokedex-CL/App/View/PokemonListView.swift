//
//  ContentView.swift
//  Pokedex-CL
//
//  Created by Jose Javier Pabon Granados on 13/03/21.
//

import SwiftUI

struct PokemonListView: View {
    private let gridItems = [GridItem(.fixed(170), spacing:20), GridItem(.fixed(170), spacing:20)]
    @ObservedObject private var viewModel = PokemonListViewModel(generations: [.first, .second, .third, .fourth])
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                Text("First Generation")
                    .font(.headline)
                ScrollView(.horizontal) {
                    LazyHGrid(rows: gridItems, spacing: 20) {
                        ForEach(viewModel.pkFirstGen) { pokemon in
                            PokemonCellView()
                        }
                    }
                }
            }
            .padding(.horizontal)
            
            .navigationTitle("Pokemon")
        }.onAppear {
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonListView()
    }
}
