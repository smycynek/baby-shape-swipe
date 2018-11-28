import Foundation
import UIKit


class Rectangle : Shape {
    init(center: Point, side1: Int, side2: Int, color: UIColor) {
        self.side1 = side1
        self.side2 = side2
        self.center = center
        self.color = color
    }
    
    func getPath() -> CGMutablePath {
        let offsetx = self.side1/2
        let offsety = self.side2/2
        let path = CGMutablePath()
        path.move(to: CGPoint(x: self.center.x - offsetx, y:  self.center.y - offsety))
        path.addLine(to: CGPoint(x:  self.center.x + offsetx, y:  self.center.y - offsety))
        path.addLine(to: CGPoint(x:  self.center.x + offsetx, y:  self.center.y + offsety))
        path.addLine(to: CGPoint(x:  self.center.x - offsetx, y:  self.center.y + offsety))
        path.closeSubpath()
        return path
    }
    var description: String { return "\(color.description) rectangle: \(center.description), side1 \(side1) side2 \(side2)" }
    var center: Point
    var side1: Int
    var side2: Int
    var color: UIColor
}

func makeScreenSpaceRectangle(center: Point, side1: Int, side2: Int, color: UIColor) -> Rectangle {
    return Rectangle(center: mapToScreen(point: center),
                     side1: mapToScreen(val: side1),
                     side2: mapToScreen(val: side2),
                     color: color)
}

