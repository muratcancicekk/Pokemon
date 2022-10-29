//
//  ContentView.swift
//  Pokemon
//
//  Created by Murat on 27.10.2022.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = HomePageViewModel()
    var body: some View {
        VStack {
            HStack {
                Text(Constants.headerName)
                    .makePrimaryLabel(size: 24)
            }
            ScrollView {
                ForEach(viewModel.homeListPokemon, id: \.self) { item in
                    NavigationLink {
                        PokemonDetailsView(pokemonDetail: item)
                    } label: {
                        HomePageListCell(pokeName: item)
                    }
                }
            }.frame(width: UIScreen.screenWidth - 20)
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
        ContentView()
    }
}
