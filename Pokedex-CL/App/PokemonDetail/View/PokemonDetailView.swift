//
//  PkemonDetailView.swift
//  Pokedex-CL
//
//  Created by Jose Javier Pabon Granados on 17/03/21.
//

import SwiftUI

struct PokemonDetailView: View {
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    ZStack {
                        VStack {
                            HStack {
                                Image("1")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 150, height: 150, alignment: .center)
                                    .shadow(color: .black, radius: 2, x: 0.0, y: 0.0)
                                Spacer()
                                ZStack {
                                    VStack(alignment: .leading) {
                                        Text("Weight: 185")
                                        Text("Height: 260")
                                    }.padding(10)
                                }.overlay(
                                    RoundedRectangle(cornerRadius: 20.0)
                                        .fill(Color.white.opacity(0.25))
                                )
                            }
                            .padding(.horizontal)
                            
                            
                            HStack(spacing: 0) {
                                
                                ForEach (0..<3) { _ in
                                    Text("Dragon")
                                        .font(.subheadline)
                                        .padding(.horizontal, 4)
                                        .padding(.vertical, 4)
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 10.0)
                                                .fill(Color.white.opacity(0.25))
                                        )
                                }.padding(.trailing)
                                
                                Spacer(minLength: 2)
                                Text("#001").font(.footnote)
                            }
                            .padding(.horizontal)
                        }
                        .padding(.vertical)
                    }
                    .background(Color.green.opacity(0.6))
                    
                    Divider()
                    //MARK: - Sprites images
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Sprites")
                            .font(.headline)
                        ScrollView(.horizontal) {
                            HStack(spacing: 5) {
                                ForEach(0..<7) { _ in
                                    VStack {
                                        Image("1")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 70, height: 70, alignment: .center)
                                            .shadow(color: .black, radius: 2, x: 0.0, y: 0.0)
                                        
                                        Text("Green")
                                            .font(.subheadline)
                                    }
                                    
                                }
                            }
                        }
                    }.padding()
                    Divider()
                    //MARK: - Movements
                    
                    VStack(alignment: .leading, spacing: 10) {
                        
                        Text("Movements")
                            .font(.headline)
                        HStack {
                            Text("Name")
                            Spacer()
                            Text("Type")
                                .padding(.horizontal, 4)
                            Text("Power")
                        }
                        ForEach(0..<5) { _ in
                            HStack {
                                Text("Scratch")
                                    .font(.subheadline)
                                Spacer()
                                Text("Type")
                                    .font(.subheadline)
                                    .padding(.horizontal, 4)
                                    .padding(.vertical, 4)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 10.0)
                                            .fill(Color.white.opacity(0.25))
                                    )
                                    .frame(width: 80, height: 20, alignment: .center)
                                Text("20")
                                    .font(.subheadline)
                            }
                            
                        }
                    }.padding()
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle("Bulbasor")
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.green.opacity(0.4))
        }.onAppear(perform: {
            UINavigationBar.appearance().backgroundColor = .green
        })
    }
}

