//
//  PokemonDetailsView.swift
//  Pokemon
//
//  Created by Murat on 27.10.2022.
//

import SwiftUI

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
                Text(String(viewModel.pokemon[0].stats?[2].stat?.name ?? ""))
            }
            else {
                ProgressView()
            }
        }.onAppear(){
            viewModel.fetchPokemonDetail(url: pokemonDetail.url ?? "")

        }
    }
}
