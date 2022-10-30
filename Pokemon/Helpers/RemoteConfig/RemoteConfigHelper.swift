//
//  RemoteConfigHelper.swift
//  Pokemon
//
//  Created by Murat on 28.10.2022.
//

import Foundation
import FirebaseRemoteConfig

class RemoteConfigHelper {
    static let shared = RemoteConfigHelper()
    private static var remoteConfig: RemoteConfig = {
        var remoteConig = RemoteConfig.remoteConfig()
        let settings = RemoteConfigSettings()
        settings.minimumFetchInterval = 0
        remoteConig.configSettings = settings
        remoteConig.setDefaults(fromPlist: "RemoteConfigDefaults")
        return remoteConig
    }()
    static func configure(exprationDuration: TimeInterval = 3600.0) {
        remoteConfig.fetch { (status, error) -> Void in
          if status == .success {
            print("Config fetched!")
            self.remoteConfig.activate { changed, error in
              // ...
            }
          } else {
            print("Config not fetched")
            print("Error: \(error?.localizedDescription ?? "No error available.")")
          }
        }

    }

    static func value(forkey key: String) -> String {
        return remoteConfig.configValue(forKey: key).stringValue!
    }
}
