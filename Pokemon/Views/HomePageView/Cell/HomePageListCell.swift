//
//  HomePageListCell.swift
//  Pokemon
//
//  Created by Murat on 29.10.2022.
//

import SwiftUI

struct HomePageListCell: View {
    private var pokeName: Results?
    init(pokeName: Results? = nil) {
        self.pokeName = pokeName
    }
    var body: some View {
        HStack {
            Image("pokemonImage")
                .myImageModifier()
            Text(pokeName?.name ?? "")
                .makePrimaryLabel()
            Spacer()
        }.padding()
    }
}

struct HomePageListCell_Previews: PreviewProvider {
    static var previews: some View {
        HomePageListCell()
    }
}
