import Foundation

class SettingsManager {
        static let gridKey = "GRID_preference"
        static let paletteKey = "PALETTE_preference"
        static let versionKey = "VERSION_preference"
        static let buildKey = "BUILD_preference"
    class func loadSettings () {
        UserDefaults.standard.register(defaults: [gridKey: true])
        UserDefaults.standard.register(defaults: [paletteKey: "Pastel"])
        let grid =  UserDefaults.standard.bool(forKey: gridKey)
        Settings.grid = grid
        let palette = UserDefaults.standard.string(forKey: paletteKey)
        if palette != nil {
            Settings.palette = palette!
        }
    }
    class func storeSettings () {
        UserDefaults.standard.set(Settings.grid, forKey: gridKey)
        UserDefaults.standard.set(Settings.palette, forKey: paletteKey)
    }
    class func updateBuildInfo() {
        let version: String = Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as! String
        UserDefaults.standard.set(version, forKey: versionKey)
        let build: String = Bundle.main.object(forInfoDictionaryKey: "CFBundleVersion") as! String
        UserDefaults.standard.set(build, forKey: buildKey)
    }
}
