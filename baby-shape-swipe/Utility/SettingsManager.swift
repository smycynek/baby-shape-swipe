import Foundation

class SettingsManager {
        static let gridKey = "GRID_preference"
        static let paletteKey = "PALETTE_preference"
        static let versionKey = "VERSION_preference"
        static let buildKey = "BUILD_preference"
    class func loadSettings () {
        let grid =  UserDefaults.standard.bool(forKey: gridKey)
        Settings.drawGrid = grid
        let palette = UserDefaults.standard.string(forKey: paletteKey)
        if palette == "Bold" {
            Settings.pastelColors = false
        } else {
            Settings.pastelColors = true
        }
    }
    class func storeSettings () {
        UserDefaults.standard.set(Settings.drawGrid, forKey: gridKey)
        if Settings.pastelColors == true {
            UserDefaults.standard.set("Pastel", forKey: paletteKey)
        } else {
            UserDefaults.standard.set("Bold", forKey: paletteKey)
        }
    }
    class func updateBuildInfo() {
        let version: String = Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as! String
        UserDefaults.standard.set(version, forKey: versionKey)
        let build: String = Bundle.main.object(forInfoDictionaryKey: "CFBundleVersion") as! String
        UserDefaults.standard.set(build, forKey: buildKey)
    }
}
