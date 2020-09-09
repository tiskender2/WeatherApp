//
//  AppDelegate.swift
//  WeatherAppwithSnapKit
//
//  Created by Tolga İskender on 8.09.2020.
//  Copyright © 2020 Tolga İskender. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        startVC()
        return true
    }
    fileprivate func startVC(){
        let splashVC = SplashVC(nibName: "SplashVC", bundle: nil)
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = splashVC
        window?.makeKeyAndVisible()
    }
}

