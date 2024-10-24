import ProjectDescription

private let ProjectPath = "Projects/TSCore"
public extension Module {
    enum TSCore: String, CaseIterable {
        case Configuration
        
        public var name: String {
            "TSCore\(self.rawValue)"
        }
    }
}

extension Module.TSCore: Moduleable {
    public var target: ProjectDescription.Target {
        Target.makeDynamicFramework(
            name: self.name,
            sources: sources,
            resources: nil,
            dependencies: [])
    }
    
    public var project: TargetDependency {
        TargetDependency.project(
            target: self.name,
            path: .relativeToRoot("\(ProjectPath)/\(self.name)")
        )
    }
}

extension Module.TSCore: TestsModuleable {
    public var tests: ProjectDescription.Target {
        Target.makeTests(
            name: self.name,
            sources: testsSources,
            resources: nil
        )
    }
}
