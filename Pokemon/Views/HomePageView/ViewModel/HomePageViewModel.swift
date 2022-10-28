//
//  HomePageViewModel.swift
//  Pokemon
//
//  Created by Murat on 27.10.2022.
//

import Foundation
class HomePageViewModel: ObservableObject {
    @Published var isLoaded = false
    @Published var homeListPokemon = [Results]()
   
    func fetchHomePokemon(){
        Network.shared.fetch(url: "https://pokeapi.co/api/v2/pokemon") { ( responce: Result<PokemonHomeModel, Error> )
            in
            switch responce {
            case .success(let success):
                DispatchQueue.main.async {
                    if let succes = success.results {
                      self.homeListPokemon = succes
                                         }
                }
            case .failure(let failure):
                print(failure)
            }
        }
    }
}
