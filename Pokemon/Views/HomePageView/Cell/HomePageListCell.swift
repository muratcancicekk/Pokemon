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
            .overlay(RoundedRectangle(cornerRadius: 8).stroke(.black, lineWidth: 0.5)
                .clipped()
                .shadow(color: Color.black, radius: 10, x: 0, y: 0))

    }
}

struct HomePageListCell_Previews: PreviewProvider {
    static var previews: some View {
        HomePageListCell()
    }
}
