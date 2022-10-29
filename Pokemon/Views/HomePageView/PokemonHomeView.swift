//
//  ContentView.swift
//  Pokemon
//
//  Created by Murat on 27.10.2022.
//

import SwiftUI

struct PokemonHomeView: View {
    @StateObject private var viewModel = HomePageViewModel()
    var body: some View {
        VStack {
            HStack {
                Text(Constants.headerName)
                    .makePrimaryLabel(size: 24)
            }
            List(viewModel.homeListPokemon, id: \.self) { item in
                NavigationLink {
                    PokemonDetailsView(pokemonDetail: item)
                } label: {
                    HomePageListCell(pokeName: item).onAppear {
                        viewModel.cellIndex += 1
                        viewModel.shouldLoadData()
                    }
                }
            }.frame(width: UIScreen.screenWidth)

            Spacer()
        }
            .padding()
            .onAppear {
            viewModel.fetchHomePokemon()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonHomeView()
    }
}
