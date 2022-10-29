//
//  CacheManager.swift
//  Pokemon
//
//  Created by Murat on 28.10.2022.
//

import Foundation

struct CacheManager {
    static let shared = CacheManager()

    func setLogoText(text: String) {
        UserDefaults.standard.set(RemoteConfigEnums.logoText.rawValue, forKey: text)
    }

    var getLogoText: String? {
        return UserDefaults.standard.value(forKey: RemoteConfigEnums.logoText.rawValue) as? String
    }
}
