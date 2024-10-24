import Foundation

public enum Environment: String, CaseIterable {
    case prod = "PROD"
    case stg = "STG"
    case dev = "DEV"
    
    var toAppExtension: EnvironmentAppExtension {
        switch self {
        case .prod: return .prod
        case .stg:  return .stg
        case .dev:  return .dev
        }
    }
}

public enum EnvironmentAppExtension: String, CaseIterable {
    case prod = "PROD"
    case stg = "STG"
    case dev = "DEV"
    case demo = "DEMO"
}
