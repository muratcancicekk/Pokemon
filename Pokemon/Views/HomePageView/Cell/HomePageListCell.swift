//
//  HomePageListCell.swift
//  Pokemon
//
//  Created by Murat on 29.10.2022.
//

import SwiftUI
import SDWebImageSwiftUI

struct HomePageListCell: View {
    private var imageUrl: String
    private var pokeName: Results?
    init(imageUrl: String, pokeName: Results? = nil) {
        self.imageUrl = imageUrl
        self.pokeName = pokeName
    }
    var body: some View {
        HStack {
            AnimatedImage(url: URL(string: imageUrl))
                .resizable()
                .frame(width: 60, height: 60)
            Text(pokeName?.name ?? "")
                .makePrimaryLabel()
            Spacer()
        }.padding()
    }
}

