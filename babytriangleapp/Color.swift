import Foundation
import UIKit

class ColorPicker
{
    static var colors = [UIColor](arrayLiteral: UIColor.red, UIColor.blue, UIColor.green,
                                  UIColor.brown, UIColor.white, UIColor.purple, UIColor.cyan,
                                  UIColor.orange, UIColor.yellow, UIColor(red: 255/255, green: 215/255, blue: 215/255, alpha: 1.0) )

    static func randomColor() -> UIColor {
        return ColorPicker.colors.randomElement()!;
    }
}

