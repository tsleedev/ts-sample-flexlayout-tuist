//
//  EnvironmentConfiguration.swift
//  TSWebAppDemo
//
//  Created by TAE SU LEE on 9/2/24.
//  Copyright © 2024 https://github.com/tsleedev/. All rights reserved.
//

import TSCoreConfiguration
import Foundation

struct EnvironmentConfiguration: EnvironmentConfigurationProtocol {
    let apiBaseURL = URL(string: "https://dev-api.yourapp.com")!
    let webBaseURL = URL(string: "https://dev-web.yourapp.com")!
}
