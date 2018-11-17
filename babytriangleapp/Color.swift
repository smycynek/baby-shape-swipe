
import Foundation
import UIKit

class ColorPicker
{
    static var colors = [UIColor](arrayLiteral: UIColor.red, UIColor.blue, UIColor.green,
                                  UIColor.brown, UIColor.white, UIColor.purple, UIColor.cyan,
                                  UIColor.orange, UIColor.yellow, UIColor.magenta )

    static func randomColor() -> UIColor {
        return ColorPicker.colors.randomElement()!;
    }
}

