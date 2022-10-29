//
//  DetailsPokemonImageCell.swift
//  Pokemon
//
//  Created by Murat on 28.10.2022.
//

import SwiftUI
import Kingfisher

struct DetailsPokemonImageCell: View {
    private var pokemonImage: String
    init(pokemonImage: String) {
        self.pokemonImage = pokemonImage
    }
    var body: some View {
        KFImage(URL(string: pokemonImage))
            .resizable()
            .frame(width: 60, height: 60)
    }
}
