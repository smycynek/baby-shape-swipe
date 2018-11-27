import Foundation
import UIKit

class ColorPicker
{
    static var standardColors = [UIColor](arrayLiteral: UIColor.red, UIColor.blue, UIColor.green,
                                  UIColor.brown,  UIColor.cyan,
                                  UIColor(red: 0.8, green: 0.2, blue: 1.0, alpha: 1.0),
                                  UIColor.orange, UIColor.yellow )

    static var pastelColors =  [UIColor](arrayLiteral:
                                         UIColor.white,
                                         
                                         UIColor(red: 1.0, green : 0.7, blue: 0.7, alpha: 1.0),
                                         UIColor(red: 0.7, green : 1.0, blue: 0.7, alpha: 1.0),
                                         UIColor(red: 0.7, green : 0.7, blue: 1.0, alpha: 1.0),
                                         UIColor(red: 1.0, green : 1.0, blue: 0.7, alpha: 1.0),
                                         UIColor(red: 1.0, green : 0.7, blue: 1.0, alpha: 1.0),
                                         UIColor(red: 0.7, green : 1.0, blue: 0.7, alpha: 1.0),
                                         UIColor(red: 0.7, green : 1.0, blue: 1.0, alpha: 1.0),
                                         UIColor(red: 0.7, green : 1.0, blue: 1.0, alpha: 1.0),
                                         UIColor(red: 1.0, green : 223/255, blue: 159/255, alpha: 1.0)
                                         );
    
    static func randomColor(pastel: Bool) -> UIColor {
        if (pastel) {
            return ColorPicker.pastelColors.randomElement()!;
        }
        else {
            return ColorPicker.standardColors.randomElement()!;
        }
    }
}

