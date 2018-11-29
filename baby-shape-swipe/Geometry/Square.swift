import Foundation
import UIKit

class Square: Shape {
    init(center: Point, side: Int, color: UIColor) {
        self.side = side
        self.center = center
        self.color = color
    }
    func getPath() -> CGMutablePath {
        let path = CGMutablePath()
        let offset = self.side/2
        path.move(to: CGPoint(x: self.center.xParam - offset, y: self.center.yParam - offset))
        path.addLine(to: CGPoint(x: self.center.xParam + offset, y: self.center.yParam - offset))
        path.addLine(to: CGPoint(x: self.center.xParam + offset, y: self.center.yParam + offset))
        path.addLine(to: CGPoint(x: self.center.xParam - offset, y: self.center.yParam + offset))
        path.closeSubpath()
        return path
    }

    var description: String { return "square: center: \(mapToModel(center).description), side: \(mapToModel(side))" }
    var center: Point
    var side: Int
    var color: UIColor
}

func makeScreenSpaceSquare(center: Point, side: Int, color: UIColor) -> Square {
    return Square(center: mapToScreen(center), side: mapToScreen(side), color: color)
}
