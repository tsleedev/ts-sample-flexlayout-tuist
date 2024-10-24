import ProjectDescription

extension AutoFillExtensionModule {
    var versionAndBuild: (SettingValue, SettingValue) {
        ("1.0", "1")
    }
    
    var targetName: String {
        switch environment {
        case .prod: return "AutoFill"
        case .stg:  return "AutoFill_Stg"
        case .dev:  return "AutoFill_Dev"
        case .demo: return "AutoFill_Demo"
        }
    }
    
    var bundleId: String {
        switch environment {
        case .prod: return extensionBundleId + ".autofill"
        case .stg:  return extensionBundleId + ".stg.autofill"
        case .dev:  return extensionBundleId + ".dev.autofill"
        case .demo: return extensionBundleId + ".demo.autofill"
        }
    }
    
    var environmentFolderName: String {
        switch environment {
        case .prod: return "PRO"
        case .stg:  return "STG"
        case .dev:  return "DEV"
        case .demo:  return "DEMO"
        }
    }
    
    var infoPlist: [String: Plist.Value] {
        [
            "CFBundleDisplayName": "\(targetName)",
            "NSExtension": [
                "NSExtensionMainStoryboard": "MainInterface",
                "NSExtensionPointIdentifier": "com.apple.authentication-services-credential-provider-ui"
            ]
        ]
    }
    
    var baseSettings: [String: SettingValue] {
        [
            "CURRENT_PROJECT_VERSION": versionAndBuild.1,
            "DEVELOPMENT_TEAM": "YW6867KB8Z",
            "MARKETING_VERSION": versionAndBuild.0
        ]
    }
}
