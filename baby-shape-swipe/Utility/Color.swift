import Foundation
import UIKit

class ColorPicker {
    static var boldColors = [UIColor](arrayLiteral: UIColor.red, UIColor.blue, UIColor.green,
                                  UIColor.brown, UIColor.cyan,
                                  UIColor(red: 0.8, green: 0.2, blue: 1.0, alpha: 1.0),
                                  UIColor.orange, UIColor.yellow )

    static var pastelColors =  [UIColor](arrayLiteral:
                                         UIColor.white,
                                         UIColor(red: 1.0, green: 0.7, blue: 0.7, alpha: 1.0),
                                         UIColor(red: 0.7, green: 1.0, blue: 0.7, alpha: 1.0),
                                         UIColor(red: 0.7, green: 0.7, blue: 1.0, alpha: 1.0),
                                         UIColor(red: 1.0, green: 1.0, blue: 0.7, alpha: 1.0),
                                         UIColor(red: 1.0, green: 0.7, blue: 1.0, alpha: 1.0),
                                         UIColor(red: 0.7, green: 1.0, blue: 0.7, alpha: 1.0),
                                         UIColor(red: 0.7, green: 1.0, blue: 1.0, alpha: 1.0),
                                         UIColor(red: 0.7, green: 1.0, blue: 1.0, alpha: 1.0),
                                         UIColor(red: 1.0, green: 223/255, blue: 159/255, alpha: 1.0)
                                         )
    static var oceanColors =  [UIColor](arrayLiteral:
                                         UIColor(red: 0.10, green: 0.3, blue: 0.9, alpha: 1.0),
                                         UIColor(red: 0.15, green: 0.3, blue: 0.8, alpha: 1.0),
                                         UIColor(red: 0.20, green: 0.4, blue: 0.7, alpha: 1.0),
                                         UIColor(red: 0.10, green: 0.4, blue: 0.6, alpha: 1.0),
                                         UIColor(red: 0.15, green: 0.4, blue: 0.9, alpha: 1.0),
                                         UIColor(red: 0.20, green: 0.5, blue: 0.8, alpha: 1.0),
                                         UIColor(red: 0.30, green: 0.5, blue: 0.7, alpha: 1.0),
                                         UIColor(red: 0.15, green: 0.5, blue: 0.6, alpha: 1.0),
                                         UIColor(red: 0.10, green: 0.6, blue: 0.7, alpha: 1.0)
    )
    static var desertColors =  [UIColor](arrayLiteral:
                                        UIColor(red: 0.80, green: 0.2, blue: 0.0, alpha: 1.0),
                                        UIColor(red: 0.90, green: 0.3, blue: 0.15, alpha: 1.0),
                                        UIColor(red: 0.80, green: 0.5, blue: 0.10, alpha: 1.0),
                                        UIColor(red: 0.70, green: 0.5, blue: 0.10, alpha: 1.0),
                                        UIColor(red: 0.60, green: 0.4, blue: 0.15, alpha: 1.0),
                                        UIColor(red: 0.90, green: 0.5, blue: 0.10, alpha: 1.0),
                                        UIColor(red: 0.80, green: 0.5, blue: 0.10, alpha: 1.0),
                                        UIColor(red: 0.60, green: 0.5, blue: 0.14, alpha: 1.0),
                                        UIColor(red: 0.70, green: 0.6, blue: 0.10, alpha: 1.0)
    )
    static func randomColor(palette: String) -> UIColor {
        switch palette {
        case "Pastel":
            return ColorPicker.pastelColors.randomElement()!
        case "Ocean":
            return ColorPicker.oceanColors.randomElement()!
        case "Desert":
            return ColorPicker.desertColors.randomElement()!
        default:
            return ColorPicker.boldColors.randomElement()!
        }
    }
}
