//
//  AppDelegate.swift
//  Pokemon
//
//  Created by Murat on 28.10.2022.
//

import Foundation
import FirebaseCore
import SwiftUI
import FirebaseRemoteConfig
import FirebaseMessaging
import Firebase

var remoteConfig = RemoteConfig.remoteConfig()

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {
        FirebaseApp.configure()
        UNUserNotificationCenter.current().delegate = self
        let authOptions: UNAuthorizationOptions = [.alert, .sound, .badge]
        UNUserNotificationCenter.current().requestAuthorization(options: authOptions) { success, error in
            if error != nil {

            }
            DispatchQueue.main.async {
                application.registerForRemoteNotifications()
            }
        }
        return true
    }
}

extension AppDelegate: UNUserNotificationCenterDelegate {
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        Messaging.messaging().apnsToken = deviceToken
    }
    func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
        print("Failed to register with push")
    }
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification:
            UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        print("Will gets called when app is in forgrount and we want to show banner")

        completionHandler([.alert, .sound, .badge])
    }
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        print("Will gets called when user tap on notification")
    }

}
