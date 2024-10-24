import ProjectDescription
import ProjectDescriptionHelpers

var targets: [Target] {
    let target: [Target] = [
        Module.Feature.Main.target,
        Module.Feature.Main.tests,
//        Module.Feature.Main.uiTests,
        Module.Feature.Main.demoApp,
        AutoFillExtensionModule(
            environment: .demo,
            extensionBundleId: AppConfig.bundleIDPrefix + "." + Module.Feature.Main.name + "DemoApp"
        ).target
    ]
    return target
}

let project = Project.app(
    name: Module.Feature.Main.rawValue,
    targets: targets
)
