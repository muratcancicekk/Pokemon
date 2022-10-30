//
//  RemoteConfigHelper.swift
//  Pokemon
//
//  Created by Murat on 28.10.2022.
//

import Foundation
import FirebaseRemoteConfig

var remoteConfig: RemoteConfig = {
    var remoteConig = RemoteConfig.remoteConfig()
    let settings = RemoteConfigSettings()
    settings.minimumFetchInterval = 0
    remoteConig.configSettings = settings
    remoteConig.setDefaults(fromPlist: "RemoteConfigDefaults")
    return remoteConig
}()

class RemoteConfigHelper {
    static let shared = RemoteConfigHelper()

    func configure(exprationDuration: TimeInterval = 3600.0) {
        remoteConfig.fetch(withExpirationDuration: 0) { [weak self] status, error in
            guard error == nil else { return }
            remoteConfig.activate()
        }

    }

    static func value(forkey key: String) -> String {
        return remoteConfig.configValue(forKey: key).stringValue!
    }
}
