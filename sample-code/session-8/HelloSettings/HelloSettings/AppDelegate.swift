//
//  AppDelegate.swift
//  HelloSettings
//
//  Created by Susan Stevens on 3/1/19.
//  Copyright © 2019 Susan Stevens. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    
        guard UserDefaults.standard.string(forKey: UserDefaultsKey.text.rawValue) == nil else { return true }
        
        let initialDefaults: [String : Any] = [
            UserDefaultsKey.text.rawValue : "Hello, Settings!",
            UserDefaultsKey.shouldFlipColors.rawValue : false,
            UserDefaultsKey.fontSize.rawValue : 30,
            UserDefaultsKey.colorId.rawValue : "teal"
        ]
        
        UserDefaults.standard.register(defaults: initialDefaults)
        return true
    }
}
