//
//  PokemonCell.swift
//  Pokedex-CL
//
//  Created by Jose Javier Pabon Granados on 14/03/21.
//

import SwiftUI

import SwiftUI

struct PokemonCellView: View {
    let gradient = LinearGradient(gradient: Gradient(colors: [.white, .green]),
                                  startPoint: .top,
                                  endPoint: .bottom)
    
    var body: some View {
        ZStack {
            VStack(alignment: .center) {
                Text("Bulbasor")
                    .font(.headline)
                
                Image("1")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 70, height: 70, alignment: .center)
                    .shadow(color: .black, radius: 2, x: 0.0, y: 0.0)
                    
                Text("1")
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
        .shadow(color: .green, radius: 5, x: 0.0, y: 4.0)
    }
}

struct PokemonCellView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonCellView()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
