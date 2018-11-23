import Foundation
import UIKit

class ColorPicker
{
    static var colors = [UIColor](arrayLiteral: UIColor.red, UIColor.blue, UIColor.green,
                                  UIColor.brown, UIColor.white, UIColor.cyan, UIColor(red: 0.8, green: 0.2, blue: 1.0, alpha: 1.0),
                                  UIColor.orange, UIColor.yellow, UIColor(red: 255/255, green: 170/255, blue: 170/255, alpha: 1.0) )

    static func randomColor() -> UIColor {
        return ColorPicker.colors.randomElement()!;
    }
}

