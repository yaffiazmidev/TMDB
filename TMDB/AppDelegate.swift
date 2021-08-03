//
//  AppDelegate.swift
//  TMDB
//
//  Created by Yaffi Azmi on 03/08/21.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        // MARK: Setup Root
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.makeKeyAndVisible()
        window.rootViewController = HomeViewController()
        self.window = window
        
        return true
    }
}

