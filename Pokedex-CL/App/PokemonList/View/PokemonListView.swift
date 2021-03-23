//
//  ContentView.swift
//  Pokedex-CL
//
//  Created by Jose Javier Pabon Granados on 13/03/21.
//

import SwiftUI

struct PokemonListView: View {
    @ObservedObject private var viewModel = PokemonListViewModel(generations: [.first, .second, .third, .fourth])
    var body: some View {
        NavigationView {
            ScrollView {
                Group {
                    //MARK:- First Gen
                    PokemonGenerationListRow(pokemons: $viewModel.pkFirstGen, title: PKGeneration.first.title)
                    Divider()
                    //MARK:- Second Gen
                    PokemonGenerationListRow(pokemons: $viewModel.pkSecondGen, title: PKGeneration.second.title)
                    Divider()
                    //MARK:- Third Gen
                    PokemonGenerationListRow(pokemons: $viewModel.pkThirdtGen, title: PKGeneration.third.title)
                    Divider()
                    //MARK:- Fourth Gen
                    PokemonGenerationListRow(pokemons: $viewModel.pkFourthGen, title: PKGeneration.fourth.title)
                }
                .padding(.horizontal)
            }
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
