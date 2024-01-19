import ProjectDescription

let settings = Settings.settings(configurations: [
    Configuration.debug(name: "debug", xcconfig: Path("config/MovieInfoProject.xcconfig")),
    Configuration.release(name: "release", xcconfig: Path("config/MovieInfoProject.xcconfig"))
])

let project = Project(
    name: "MovieInfo",
    organizationName: "JY",
    settings: settings,
    targets: [// 1
        Target(
          // 2
          name: "MovieInfo",
          // 3
          platform: .iOS,
          // 4
          product: .app,
          // 5
          bundleId: "jy",
          // 6
          infoPlist: "MovieInfo/Info.plist",
          // 7
          sources: ["MovieInfo/Source/**"],
          // 8
          resources: ["MovieInfo/Resources/**"],
          // 9
          dependencies: [],
          // 10
          settings: nil)]
    )

