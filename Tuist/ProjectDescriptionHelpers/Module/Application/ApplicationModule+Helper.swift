import ProjectDescription

extension ApplicationModule {
    var versionAndBuild: (SettingValue, SettingValue) {
        ("1.0", "1")
    }
    
    var targetName: String {
        switch environment {
        case .prod: return AppConfig.projectName
        case .stg:  return AppConfig.projectName + "Stg"
        case .dev:  return AppConfig.projectName + "Dev"
        }
    }
    
    var bundleId: String {
        switch environment {
        case .prod: return AppConfig.bundleIDPrefix
        case .stg:  return AppConfig.bundleIDPrefix + ".stg"
        case .dev:  return AppConfig.bundleIDPrefix + ".dev"
        }
    }
    
    var environmentFolderName: String {
        switch environment {
        case .prod: return "PROD"
        case .stg:  return "STG"
        case .dev:  return "DEV"
        }
    }
    
    var infoPlist: [String: Plist.Value] {
        [
            "CFBundleDevelopmentRegion": "ko_KR",
            "CFBundleShortVersionString": "$(MARKETING_VERSION)",
            "CFBundleVersion": "$(CURRENT_PROJECT_VERSION)",
            "CFBundleURLTypes": [
                [
                    "CFBundleTypeRole": "Editor",
                    "CFBundleURLSchemes": [
                        "tswebapp",
                    ]
                ]
            ],
            "FirebaseAutomaticScreenReportingEnabled": false, // Firebase 자동 화면 조회수 보고 중지
            "GADIsAdManagerApp": true,
            "ITSAppUsesNonExemptEncryption": false,
            "LSApplicationQueriesSchemes": [
                "kakaolink",
                "kakaotalk",
                "line",
            ],
            "LSRequiresIPhoneOS": true,
            "NSAppTransportSecurity": [
                "NSAllowsArbitraryLoads": true,
                "NSAllowsArbitraryLoadsForMedia": true,
                "NSAllowsArbitraryLoadsInWebContent": true
            ],
            "NSCameraUsageDescription": "프로필 사진을 찍을때 필요합니다.",
            "NSFaceIDUsageDescription": "Face ID로 암호 잠금 해제를 위해서는 권한 승인이 필요합니다.",
            "NSLocationAlwaysAndWhenInUseUsageDescription": "앱 사용 중 및 백그라운드에서 위치 정보를 사용합니다.",
            "NSLocationAlwaysUsageDescription": "백그라운드에서도 위치 정보를 사용합니다.",
            "NSLocationWhenInUseUsageDescription": "앱 사용 중 위치 정보를 사용합니다.",
            "NSPhotoLibraryAddUsageDescription": "이미지 저장을 위해서는 권한 승인이 필요합니다.",
            "NSUserTrackingUsageDescription": "추적을 허용하시면, 불필요한 광고 대신 관심사 맞춤형 광고를 받을 수 있습니다. 추적을 허용하지 않더라도 광고는 노출됩니다.",
            "UIBackgroundModes": [
                "location",
            ],
            "UILaunchScreen": [
                "UIColorName": "LaunchScreenBackground"
            ],
            "UISupportedInterfaceOrientations": [
                "UIInterfaceOrientationPortrait"
            ],
            "UIUserInterfaceStyle": "Light",
        ]
    }
    
    var baseSettings: [String: SettingValue] {
        [
            "CURRENT_PROJECT_VERSION": versionAndBuild.1,
            "DEVELOPMENT_TEAM": "YW6867KB8Z",
            "MARKETING_VERSION": versionAndBuild.0
        ]
    }
    
    var launchArguments: [LaunchArgument] {
        switch environment {
        case .prod:
            return [
            ]
        case .stg:
            return [
            ]
        case .dev:
            return [
            ]
        }
    }
}
