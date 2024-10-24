import ProjectDescription
import ProjectDescriptionHelpers

var targets: [Target] {
    let target: [Target] = [
        ApplicationModule(environment: .prod).target,
        ApplicationModule(environment: .stg).target,
        ApplicationModule(environment: .dev).target,
        AutoFillExtensionModule(environment: .prod).target,
        AutoFillExtensionModule(environment: .stg).target,
        AutoFillExtensionModule(environment: .dev).target,
    ]
    return target
}

let project = Project.app(
    name: "Application",
    targets: targets
)
