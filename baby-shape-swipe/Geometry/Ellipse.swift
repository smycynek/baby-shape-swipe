import Foundation
import UIKit

class Ellipse: Shape {
    init(center: Point, side1: Int, side2: Int, color: UIColor) {
        self.side1 = side1
        self.side2 = side2
        self.center = center
        self.color = color
    }
    func getPath() -> CGMutablePath {
        let offsetX = self.side1/2
        let offsetY = self.side2/2
        let path = CGMutablePath()
        let boundingRectangle = CGRect(
            x: center.xParam - offsetX,
            y: center.yParam - offsetY,
            width: side1,
            height: side2)
        path.addEllipse(in: boundingRectangle)
        path.closeSubpath()
        return path
    }
    var description: String {
        let description =
        """
        ellipse:
        center: \(mapToModel(center).description),
        side1: \(mapToModel(side1))
        side2: \(mapToModel(side2))
        """
        return description
    }
    var center: Point
    var side1: Int
    var side2: Int
    var color: UIColor
}

func makeScreenSpaceEllipse(center: Point, side1: Int, side2: Int, color: UIColor) -> Ellipse {
    return Ellipse(center: mapToScreen(center),
                     side1: mapToScreen(side1),
                     side2: mapToScreen(side2),
                     color: color)
}
