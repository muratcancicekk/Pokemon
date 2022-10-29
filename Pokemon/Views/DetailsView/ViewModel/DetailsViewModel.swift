//
//  DetailsViewModel.swift
//  Pokemon
//
//  Created by Murat on 28.10.2022.
//

import Foundation

final class PokemonDetailsViewModel: ObservableObject {
    @Published var pokemon = [Pokemon]()
    @Published var isLoaded = false
    @Published var deneme = [String]()

    func fetchPokemonDetail(url: String) {
        Network.shared.networkReq(url: url) { pokemon in
            self.pokemon = [pokemon]
            self.deneme.append(pokemon.sprites?.frontDefault ?? "")
            self.deneme.append(pokemon.sprites?.backDefault ?? "")
            self.deneme.append(pokemon.sprites?.backShiny ?? "")
            self.deneme.append(pokemon.sprites?.frontShiny ?? "")
            self.deneme.append(pokemon.sprites?.other?.dreamWorld?.frontDefault ?? "")
            self.deneme.append(pokemon.sprites?.other?.home?.frontShiny ?? "")
            self.deneme.append(pokemon.sprites?.other?.home?.frontDefault ?? "")
            self.deneme.append(pokemon.sprites?.other?.officialArtwork?.frontDefault ?? "")
            self.isLoaded = true
        }
    }
}
