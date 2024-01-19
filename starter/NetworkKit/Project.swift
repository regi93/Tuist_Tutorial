import ProjectDescription

let settings = Settings.settings(configurations: [
    Configuration.debug(name: "debug", xcconfig: Path("config/NetworkKitProject.xcconfig")),
    Configuration.release(name: "release", xcconfig: Path("config/NetworkKitProject.xcconfig"))
])

let targetSettings = Settings.settings(configurations: [
    Configuration.debug(name: "debug", xcconfig: Path("config/NetworkKitTarget.xcconfig")),
    Configuration.release(name: "release", xcconfig: Path("config/NetworkKitTarget.xcconfig"))
])



let project = Project(
    name: "NetworkKitProject",
    organizationName: "JY",
    settings: settings,
    targets: [// 1
        Target(
          // 2
          name: "NetworkKit",
          // 3
          platform: .iOS,
          // 4
          product: .app,
          // 5
          bundleId: "jy",
          // 6
          infoPlist: "NetworkKit/Info.plist",
          // 7
          sources: ["NetworkKit/Source/**"],
          // 8
          resources: ["NetworkKit/Resources/**"],
          // 9
          dependencies: [],
          // 10
          settings: targetSettings)]
    )

