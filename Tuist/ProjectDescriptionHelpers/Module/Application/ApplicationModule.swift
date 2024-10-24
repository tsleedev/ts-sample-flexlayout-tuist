import ProjectDescription

let ApplicationProjectPath = "Projects/Application"

public struct ApplicationModule {
    let environment: Environment
    
    public init(environment: Environment) {
        self.environment = environment
    }
}

extension ApplicationModule: Moduleable {
    public var sources: SourceFilesList? {
        let globs: [ProjectDescription.SourceFileGlob] = [
            .glob(.relativeToRoot("\(ApplicationProjectPath)/Sources/**")),
            .glob(.relativeToRoot("\(ApplicationProjectPath)/Environments/\(environmentFolderName)/**")),
        ]
        return SourceFilesList.sourceFilesList(globs: globs)
    }
    
    public var resources: ResourceFileElements? {
        [
            .glob(pattern: .relativeToRoot("\(ApplicationProjectPath)/Environments/\(environmentFolderName)/**")),
            .glob(pattern: .relativeToRoot("\(ApplicationProjectPath)/Resources/**")),
        ]
    }
    
    public var dependencies: [TargetDependency] {
        [
            Module.TSCore.Configuration.project,
            Module.Feature.Main.project,
            .target(name: AutoFillExtensionModule(environment: environment.toAppExtension).targetName),
        ]
    }
    
    public var settings: Settings? {
        .settings(
            base: baseSettings,
            defaultSettings: .recommended
        )
    }
    
    public var target: ProjectDescription.Target {
        Target.makeApp(
            name: targetName,
            bundleId: bundleId,
            infoPlist: .extendingDefault(with: infoPlist),
            sources: sources,
            resources: resources,
            headers: headers,
//            entitlements: .file(path: .relativeToRoot("\(ApplicationProjectPath)/TSWebAppDemo.entitlements")),
            dependencies: dependencies,
            settings: settings,
            launchArguments: launchArguments
        )
    }
    
    public var project: TargetDependency {
        return .project(
            target: AppConfig.projectName,
            path: .relativeToManifest("")
        )
    }
}

extension ApplicationModule: TestsModuleable {
    public var tests: ProjectDescription.Target {
        return Target.makeTests(
            name: AppConfig.projectName,
            sources: testsSources,
            resources: nil
        )
    }
}
