//
//  ContentView.swift
//  Pokemon
//
//  Created by Murat on 27.10.2022.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = HomePageViewModel()
    var body: some View {
        VStack {
            HStack {
                Text("Pokemon List")
            }
            HStack(spacing: 20) {
                ScrollView{
                    ForEach(viewModel.homeListPokemon, id: \.self) { item in
                        NavigationLink {
                            PokemonDetailsView(pokemonDetail: item)
                        } label: {
                            Image("pokemonImage")
                                .resizable()
                                .frame(width: 120, height: 120)
                            Text(item.name ?? "")
                                .fontWeight(.black)
                                .foregroundColor(.white)
                                .font(.system(size: 20))
                        }
            
                    }
                }
            }   .background(.blue)
                .cornerRadius(8)
            Spacer()
        }
        .padding()
        .onAppear{
            viewModel.fetchHomePokemon()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
