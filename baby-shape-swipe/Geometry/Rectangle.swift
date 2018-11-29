import Foundation
import UIKit

class Rectangle: Shape {
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
        path.move(to: CGPoint(x: self.center.x - offsetx, y: self.center.y - offsety))
        path.addLine(to: CGPoint(x: self.center.x + offsetx, y: self.center.y - offsety))
        path.addLine(to: CGPoint(x: self.center.x + offsetx, y: self.center.y + offsety))
        path.addLine(to: CGPoint(x: self.center.x - offsetx, y: self.center.y + offsety))
        path.closeSubpath()
        return path
    }
    var description: String { return "rectangle: center: \(mapToModel(center).description), side1: \(mapToModel(side1)) side2: \(mapToModel(side2))" }
    var center: Point
    var side1: Int
    var side2: Int
    var color: UIColor
}

func makeScreenSpaceRectangle(center: Point, side1: Int, side2: Int, color: UIColor) -> Rectangle {
    return Rectangle(center: mapToScreen(center),
                     side1: mapToScreen(side1),
                     side2: mapToScreen(side2),
                     color: color)
}
