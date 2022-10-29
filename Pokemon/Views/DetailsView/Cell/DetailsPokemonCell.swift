//
//  DetailsPokemonCell.swift
//  Pokemon
//
//  Created by Murat on 28.10.2022.
//

import SwiftUI

struct DetailsPokemonCell: View {
   private var pokemonStats: Stat
    init(pokemonStats: Stat) {
        self.pokemonStats = pokemonStats
    }
    var body: some View {
        HStack {
            Text(pokemonStats.stat?.name ?? "")
            Spacer()
            Text("\(pokemonStats.baseStat ?? 2)")
        }
    }
}
