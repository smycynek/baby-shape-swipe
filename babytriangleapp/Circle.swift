import Foundation
import UIKit


class Circle {
    init(center: Point, radius: Int, color: UIColor) {
        self.center = center;
        self.radius = radius;
        self.color = color;
    }
    
    static func makeDefault() -> Circle {
        
        let point1 = mapToScreen (point: Point(x:3, y:3))
        let radius = mapToScreen(val: 3, offset : 0)
        let circle = Circle(center: point1,
                            radius: radius,
                            color: ColorPicker.randomColor()
                            )
        return circle
    }

    var description: String { return "\(color.description) circle: \(center.description), radius \(radius)" }
    var center: Point
    var radius: Int
    var color: UIColor
}

func makeCircle(center: Point, radius: Int, color: UIColor) -> Circle {
    return Circle(center: mapToScreen(point: center), radius: mapToScreen(val: radius), color: color)
}

