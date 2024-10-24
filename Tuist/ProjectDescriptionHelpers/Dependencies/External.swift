import ProjectDescription

public enum External: String {
    case FlexLayout
    case PinLayout
}

public extension External {
    var dependency: TargetDependency {
        .external(name: self.rawValue)
    }
}
