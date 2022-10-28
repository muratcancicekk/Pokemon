//
//  DetailsViewModel.swift
//  Pokemon
//
//  Created by Murat on 28.10.2022.
//

import Foundation

class PokemonDetailsViewModel: ObservableObject {
    @Published var pokemon = [Pokemon]()
    @Published var isLoaded = false

    func fetchPokemonDetail(url: String) {
        Network.shared.networkReq(url: url) { pokemon in
            self.pokemon = [pokemon]
            self.isLoaded = true
        }
    }
}
