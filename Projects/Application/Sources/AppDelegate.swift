//
//  AppDelegate.swift
//  TSFlexLayoutTuistSample
//
//  Created by TAE SU LEE on 10/24/24.
//  Copyright © 2024 https://github.com/tsleedev/. All rights reserved.
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
