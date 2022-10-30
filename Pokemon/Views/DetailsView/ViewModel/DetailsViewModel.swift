//
//  DetailsViewModel.swift
//  Pokemon
//
//  Created by Murat on 28.10.2022.
//

import Foundation

final class PokemonDetailsViewModel: ObservableObject {
    @Published var pokemon = [PokemonDetails]()
    @Published var isLoaded = false
    @Published var pokemonImage = [String]()

    func fetchPokemonDetail(url: String) {
        Network.shared.fetch(url: url) { [weak self] (response: Result<PokemonDetails, Error>) in
            guard let self = self else {return}
            switch response {
            case .success(let pokemon):
                DispatchQueue.main.async {
                    self.pokemon = [pokemon]
                    self.pokemonImage.append(pokemon.sprites?.frontDefault ?? "")
                    self.pokemonImage.append(pokemon.sprites?.backDefault ?? "")
                    self.pokemonImage.append(pokemon.sprites?.backShiny ?? "")
                    self.pokemonImage.append(pokemon.sprites?.frontShiny ?? "")
                    self.pokemonImage.append(pokemon.sprites?.other?.home?.frontShiny ?? "")
                    self.pokemonImage.append(pokemon.sprites?.other?.home?.frontDefault ?? "")
                    self.pokemonImage.append(pokemon.sprites?.versions?.generationI?.redBlue?.frontDefault ?? "")
                    self.pokemonImage.append(pokemon.sprites?.versions?.generationI?.redBlue?.backDefault ?? "")
                    self.pokemonImage.append(pokemon.sprites?.versions?.generationI?.redBlue?.backGray ?? "")
                    self.pokemonImage.append(pokemon.sprites?.versions?.generationI?.redBlue?.frontGray ?? "")
                    self.pokemonImage.append(pokemon.sprites?.versions?.generationI?.yellow?.frontDefault ?? "")
                    self.pokemonImage.append(pokemon.sprites?.versions?.generationI?.yellow?.backDefault ?? "")
                    self.pokemonImage.append(pokemon.sprites?.versions?.generationI?.yellow?.backGray ?? "")
                    self.pokemonImage.append(pokemon.sprites?.versions?.generationI?.yellow?.frontGray ?? "")
                    self.pokemonImage.append(pokemon.sprites?.versions?.generationIi?.crystal?.frontDefault ?? "")
                    self.pokemonImage.append(pokemon.sprites?.versions?.generationIi?.crystal?.backDefault ?? "")
                    self.pokemonImage.append(pokemon.sprites?.versions?.generationIi?.crystal?.frontShiny ?? "")
                    self.pokemonImage.append(pokemon.sprites?.versions?.generationIi?.gold?.frontDefault ?? "")
                    self.pokemonImage.append(pokemon.sprites?.versions?.generationIi?.gold?.backDefault ?? "")
                    self.pokemonImage.append(pokemon.sprites?.versions?.generationIi?.gold?.frontShiny ?? "")
                    self.pokemonImage.append(pokemon.sprites?.versions?.generationIi?.gold?.backShiny ?? "")
                    self.pokemonImage.append(pokemon.sprites?.versions?.generationIv?.diamondPearl?.frontDefault ?? "")
                    self.pokemonImage.append(pokemon.sprites?.versions?.generationIv?.diamondPearl?.backDefault ?? "")
                    self.pokemonImage.append(pokemon.sprites?.versions?.generationIv?.diamondPearl?.frontShiny ?? "")
                    self.pokemonImage.append(pokemon.sprites?.versions?.generationIv?.heartgoldSoulsilver?.frontDefault ?? "")
                    self.pokemonImage.append(pokemon.sprites?.versions?.generationIv?.heartgoldSoulsilver?.backDefault ?? "")
                    self.pokemonImage.append(pokemon.sprites?.versions?.generationIv?.heartgoldSoulsilver?.frontShiny ?? "")
                    self.pokemonImage.append(pokemon.sprites?.versions?.generationIv?.heartgoldSoulsilver?.backShiny ?? "")
                    self.isLoaded = true
                }
            case .failure(let failure):
                print("errordetail",failure.localizedDescription)
            }
        }
    }
}
