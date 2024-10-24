import ProjectDescription

private let ProjectPath = "Projects/Feature"
public extension Module {
    enum Feature: String, CaseIterable {
        case Main
        case Settings
        
        public var name: String {
             "Feature\(self.rawValue)"
        }
    }
}

extension Module.Feature: Moduleable {
    public var resources: ResourceFileElements? {
        let resources: ResourceFileElements?
        switch self {
        case .Main, .Settings:
            resources = []
        }
        return resources
    }
    
    public var dependencies: [TargetDependency] {
        let targetSpecificDependencies: [TargetDependency]
        switch self {
        case .Main:
            targetSpecificDependencies = [
                Module.Feature.Settings.project,
                External.FlexLayout.dependency,
                External.PinLayout.dependency,
            ]
        case .Settings:
            targetSpecificDependencies = [
                External.FlexLayout.dependency,
                External.PinLayout.dependency,
            ]
        }
        return targetSpecificDependencies
    }
    
    public var settings: Settings? {
        let settings: Settings?
        switch self {
        case .Main, .Settings:
            settings = .settings(
                base: [
                    "OTHER_LDFLAGS": "-ObjC"
                ]
            )
        }
        return settings
    }
    
    public var target: ProjectDescription.Target {
        Target.makeDynamicFramework(
            name: self.name,
            sources: sources,
            resources: resources,
            dependencies: dependencies,
            settings: settings
        )
    }
    
    public var project: TargetDependency {
        TargetDependency.project(
            target: self.name,
            path: .relativeToRoot("\(ProjectPath)/\(self.name)")
        )
    }
}

extension Module.Feature: TestsModuleable {
    public var tests: ProjectDescription.Target {
        Target.makeTests(
            name: self.name,
            sources: testsSources,
            resources: nil
        )
    }
}

extension Module.Feature: UITestsModuleable {
    public var uiTests: ProjectDescription.Target {
        Target.makeUITests(
            name: self.name,
            sources: uiTestsSources,
            resources: nil,
            dependencies: [
                .target(name: self.name),
                .target(name: AutoFillExtensionModule(
                    environment: .demo,
                    extensionBundleId: AppConfig.bundleIDPrefix + "." + self.name + "DemoApp"
                ).targetName),
            ]
        )
    }
}

extension Module.Feature: DemoAppModuleable {
    public var demoApp: ProjectDescription.Target {
        Target.makeDemoApp(
            name: self.name,
            sources: demoAppSources,
            resources: demoAppResources,
            dependencies: [
                .target(name: self.name),
            ]
        )
    }
}
