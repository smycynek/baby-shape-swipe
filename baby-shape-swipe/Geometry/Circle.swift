import Foundation
import UIKit


class Circle : Shape {
    init(center: Point, radius: Int, color: UIColor) {
        self.center = center;
        self.radius = radius;
        self.color = color;
    }
    
    func getPath() -> CGMutablePath {
        let path = CGMutablePath()
        path.move(to: CGPoint(x: self.center.x + self.radius, y: self.center.y))
        path.addArc(center:
            CGPoint(x: self.center.x, y: self.center.y),
                    radius: CGFloat (self.radius),
                    startAngle: 0, endAngle: CGFloat(Double.pi * 2), clockwise: false)
        path.closeSubpath()
        return path;
    }

    var description: String { return "\(color.description) circle: \(center.description), radius \(radius)" }
    var center: Point
    var radius: Int
    var color: UIColor
}

func makeScreenSpaceCircle(center: Point, radius: Int, color: UIColor) -> Circle {
    return Circle(center: mapToScreen(point: center), radius: mapToScreen(val: radius), color: color)
}

