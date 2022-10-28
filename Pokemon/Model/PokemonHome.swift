//
//  PokemonHome.swift
//  Pokemon
//
//  Created by Murat on 27.10.2022.
//

import Foundation


// MARK: - Welcome3
struct PokemonHomeModel: Decodable, Hashable {
    let results: [Results]?
}

// MARK: - Result
struct Results: Decodable, Hashable {
    let name: String?
    let url: String?
}

