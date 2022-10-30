//
//  HomePageViewModel.swift
//  Pokemon
//
//  Created by Murat on 27.10.2022.
//

import Foundation
final class HomePageViewModel: ObservableObject {
    @Published var isLoaded = false
    @Published var homeListPokemon = [Results]()
    @Published var cellIndex = 0
    @Published var pageNumber = 1

    func fetchHomePokemon() {
        Network.shared.fetch(url: "https://pokeapi.co/api/v2/pokemon?offset=\(self.pageNumber)&limit=20") { (responce: Result<PokemonHomeModel, Error>)
            in
            switch responce {
            case .success(let success):
                DispatchQueue.main.async {
                    if let succes = success.results {
                        self.homeListPokemon.append(contentsOf: succes)
                    }
                }
            case .failure(let failure):
                print(failure)
            }
        }
    }
    func createUrlForImage(id: String) -> String {
        let id = id.components(separatedBy: "/")
        let number = id[id.count - 2]
        let url = "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/\(number).png"
        return url
    }

    func shouldLoadData() {
        if self.cellIndex % 20 == 0 {
            self.pageNumber += 20
            fetchHomePokemon()
        }
    }
}
