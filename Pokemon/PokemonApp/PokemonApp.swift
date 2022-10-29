//
//  PokemonApp.swift
//  Pokemon
//
//  Created by Murat on 27.10.2022.
//

import SwiftUI

@main
struct PokemonApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate

    var body: some Scene {
        WindowGroup {
            NavigationView {
                SplashScreen()
            }
        }
    }
}
