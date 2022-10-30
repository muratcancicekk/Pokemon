//
//  PokemonDetailsView.swift
//  Pokemon
//
//  Created by Murat on 27.10.2022.
//

import SwiftUI
import FirebaseAnalytics

struct PokemonDetailsView: View {
    @StateObject private var viewModel = PokemonDetailsViewModel()
    private var pokemonDetail: Results? {
        didSet {
            Analytics.logEvent("pokemonDetails", parameters: ["name": pokemonDetail?.name ?? "",
                "id": viewModel.pokemon[0].id ?? ""])
        }
    }
    init(pokemonDetail: Results) {
        self.pokemonDetail = pokemonDetail
    }
    var body: some View {
        VStack {
            if viewModel.isLoaded {
                Text(pokemonDetail?.name ?? "")
                    .makePrimaryLabel()
                GeometryReader { _ in
                    ScrollView {
                        LazyVGrid(columns: [
                            GridItem(.flexible()),
                            GridItem(.flexible()),
                            GridItem(.flexible())], spacing: 3) {
                            ForEach(viewModel.pokemonImage, id: \.self) { index in
                                DetailsPokemonImageCell(pokemonImage: index)
                            }
                        }
                    }
                }
                Text(Constants.stats)
                    .makePrimaryLabel(size: 24, color: .cyan)
                if let stat = viewModel.pokemon[0].stats {
                    List(stat, id: \.self) { index in
                        DetailsPokemonCell(pokemonStats: index)
                    }
                }
            }
            else {
                ProgressView()
            }
        }.onAppear {
            viewModel.fetchPokemonDetail(url: pokemonDetail?.url ?? "")
        }

    }
}
