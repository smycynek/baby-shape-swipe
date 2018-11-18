import Foundation
import UIKit


class Square {
    init(centerval: Point, sideval: Int, colorval: UIColor) {
        side = sideval;
        center = centerval
        color = colorval
    }
    

    static func makeDefault() -> Square {
        
        let point1 = mapToScreen (point: Point(xval:3, yval:3), offsetx: 0, offsety: 40)
        let radius1 = mapToScreen(val: 3, offset : 0)
        let square = Square(centerval: point1, sideval: radius1, colorval: ColorPicker.randomColor())
                        
        
        return square
        
    }

    

    var description: String { return "\(color.description) square: \(center.description), side \(side)" }
    var center: Point
    var side: Int
    var color: UIColor
}



func makeSquare(centerval: Point, sideval: Int, colorval: UIColor) -> Square {
    
    return Square(centerval: mapToScreen(point: centerval, offsetx: 0, offsety: 40), sideval: mapToScreen(val: sideval, offset : 0), colorval: colorval)
}

