//
//  AppDelegate.swift
//  ArabamAssignment
//
//  Created by Furkan Arslan on 25.01.2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
            let window = UIWindow(windowScene: windowScene)
            self.window = window
            AppRouter.shared.startApp(window: window, dataProvider: apiDataProvider)
        }
        return true
    }

}

