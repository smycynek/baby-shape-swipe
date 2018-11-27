import Foundation
import UIKit


class Square {
    init(center: Point, side: Int, color: UIColor) {
        self.side = side;
        self.center = center;
        self.color = color;
    }
    
    
    func getPath() -> CGMutablePath {
        let path = CGMutablePath()
        let offset = self.side/2
        path.move(to: CGPoint(x: self.center.x - offset, y: self.center.y - offset))
        path.addLine(to: CGPoint(x: self.center.x + offset, y: self.center.y - offset))
        path.addLine(to: CGPoint(x: self.center.x + offset, y: self.center.y + offset))
        path.addLine(to: CGPoint(x: self.center.x - offset, y: self.center.y + offset))
        path.closeSubpath()
        return path;
    }

    var description: String { return "\(color.description) square: \(center.description), side \(side)" }
    var center: Point
    var side: Int
    var color: UIColor
}

func makeScreenSpaceSquare(center: Point, side: Int, color: UIColor) -> Square {    
    return Square(center: mapToScreen(point: center), side: mapToScreen(val: side), color: color)
}

