//
//  PokemonCell.swift
//  Pokedex-CL
//
//  Created by Jose Javier Pabon Granados on 14/03/21.
//

import SwiftUI
import PokedexCLCore
import Kingfisher

struct PokemonCellView: View {
    let pokemon: PKPreview
    let gradient = LinearGradient(gradient: Gradient(colors: [.white, .gray]),
                                  startPoint: .top,
                                  endPoint: .bottom)
    
    var body: some View {
        ZStack {
            VStack(alignment: .center) {
                Text(pokemon.name)
                    .font(.headline)
                
                KFImage(pokemon.officialArtwork)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 70, height: 70, alignment: .center)
                    .shadow(color: .black, radius: 2, x: 0.0, y: 0.0)
                    
                Text(pokemon.id)
                    .font(.subheadline)
                    .padding(.horizontal, 16)
                    .padding(.vertical, 8)
                    .overlay(
                        RoundedRectangle(cornerRadius: 20.0)
                            .fill(Color.white.opacity(0.25))
                    )
                    .frame(width: 80, height: 25, alignment: .center)
            }
        }
        .padding()
        .background(gradient.opacity(0.5))
        .cornerRadius(15)
        .shadow(color: .blue, radius: 5, x: 0.0, y: 4.0)
    }
}
