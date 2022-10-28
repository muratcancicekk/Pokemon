//
//  PokemonDetailsView.swift
//  Pokemon
//
//  Created by Murat on 27.10.2022.
//

import SwiftUI
import Kingfisher

struct PokemonDetailsView: View {
    @StateObject var viewModel = PokemonDetailsViewModel()
    var pokemonDetail: Results
    init(pokemonDetail: Results) {
        self.pokemonDetail = pokemonDetail
    }
    var body: some View {
        VStack {
            if viewModel.isLoaded {
                Text(pokemonDetail.name ?? "")
                Text(pokemonDetail.url ?? "")
                List(viewModel.deneme, id: \.self) { index in
                    DetailsPokemonImageCell(pokemonImage: index)
                }
                List(viewModel.pokemon[0].stats!, id: \.self) { index in
                    DetailsPokemonCell(pokemonStats: index)
                }
            }
            else {
                ProgressView()
            }
        }.onAppear {
            viewModel.fetchPokemonDetail(url: pokemonDetail.url ?? "")
        }
    }
}
