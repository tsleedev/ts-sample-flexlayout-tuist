import ProjectDescription

let AutoFillProjectPath = "Projects/AppExtension/AutoFill"

public struct AutoFillExtensionModule {
    let environment: EnvironmentAppExtension
    let extensionBundleId: String
    
    public init(environment: EnvironmentAppExtension, extensionBundleId: String = AppConfig.bundleIDPrefix) {
        self.environment = environment
        self.extensionBundleId = extensionBundleId
    }
}

extension AutoFillExtensionModule: Moduleable {
    public var sources: SourceFilesList? {
        let globs: [ProjectDescription.SourceFileGlob] = [
            .glob(.relativeToRoot("\(AutoFillProjectPath)/Sources/**"))
        ]
        return SourceFilesList.sourceFilesList(globs: globs)
    }
    
    public var resources: ResourceFileElements? {
        [
//            .glob(pattern: .relativeToRoot("\(AutoFillProjectPath)/Environments/\(environmentFolderName)/**")),
            .glob(pattern: .relativeToRoot("\(AutoFillProjectPath)/Resources/**")),
        ]
    }
    
    public var dependencies: [TargetDependency] {
        [
            External.FlexLayout.dependency,
            External.PinLayout.dependency,
            Module.Feature.Main.project,
        ]
    }
    
    public var settings: Settings? {
        .settings(
            base: baseSettings,
            defaultSettings: .recommended
        )
    }
    
    public var target: ProjectDescription.Target {
        Target.makeAppExtension(
            name: targetName,
            bundleId: bundleId,
            infoPlist: .extendingDefault(with: infoPlist),
            sources: sources,
            resources: resources,
            entitlements: .file(path: .relativeToRoot("\(AutoFillProjectPath)/AutoFill.entitlements")),
            dependencies: dependencies,
            settings: settings)
    }
    
    public var project: TargetDependency {
        .project(
            target: AppConfig.projectName,
            path: .relativeToManifest("")
        )
    }
}

extension AutoFillExtensionModule: TestsModuleable {
    public var tests: ProjectDescription.Target {
        Target.makeTests(
            name: AppConfig.projectName,
            sources: testsSources,
            resources: nil
        )
    }
}
