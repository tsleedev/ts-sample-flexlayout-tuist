//
//  AppAppDelegate.swift
//  FeatureApp
//
//  Created by TAE SU LEE on 2023/09/20.
//  Copyright © 2023 https://github.com/tsleedev/. All rights reserved.
//

import FeatureMain
import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil
    ) -> Bool {
        let viewController = ViewControllerFactory.createMainViewController()
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = UINavigationController(rootViewController: viewController)
        window?.makeKeyAndVisible()

        return true
    }
}
