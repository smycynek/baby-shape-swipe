import Foundation
import UIKit


class Circle {
    init(centerval: Point, radiusval: Int, colorval: UIColor) {
        center = centerval;
        radius = radiusval
        color = colorval
    }
    
    static func makeDefault() -> Circle {
        
        let point1 = mapToScreen (point: Point(xval:3, yval:3), offsetx: 0, offsety: 40)
        let radius1 = mapToScreen(val: 3, offset : 0)
        let circle = Circle(centerval: point1,
                            radiusval: radius1,
                            colorval: ColorPicker.randomColor()
                            )
        return circle

    }

    var description: String { return "\(color.description) circle: \(center.description), radius \(radius)" }
    var center: Point
    var radius: Int
    var color: UIColor
}



func makeCircle(centerval: Point, radiusval: Int, colorval: UIColor) -> Circle {
    
    return Circle(centerval: mapToScreen(point: centerval, offsetx: 0, offsety: 40), radiusval: mapToScreen(val: radiusval, offset : 0), colorval: colorval)
}

