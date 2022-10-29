//
//  SplashScreen.swift
//  Pokemon
//
//  Created by Murat on 29.10.2022.
//

import SwiftUI

struct SplashScreen: View {
    @State private var isActive = false
    @State private var size = 0.8
    @State private var opacity = 0.5
    var body: some View {
        if isActive {
            PokemonHomeView()
        }
        else {
            ZStack {
                Color.blue.ignoresSafeArea()
                VStack {
                    VStack {
                        Image(Constants.splashImage)
                            .resizable()
                            .frame(width: UIScreen.screenWidth * 0.25, height: UIScreen.screenHeight * 0.2)
                    }
                        .scaleEffect(size)
                        .opacity(opacity)
                        .onAppear {
                        withAnimation(.easeIn(duration: 1.2)) {
                            self.size = 0.9
                            self.opacity = 1.0
                        }
                    }
                        .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                            self.isActive = true
                        }
                    }
                }
            }
        }
    }
}

struct SplashScreen_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreen()
    }
}
