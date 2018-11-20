import Foundation
import UIKit


class Square {
    init(center: Point, side: Int, color: UIColor) {
        self.side = side;
        self.center = center;
        self.color = color;
    }
    
    static func makeDefault() -> Square {
        let point1 = mapToScreen (point: Point(x:3, y:3), yOffset: 40)
        let radius = mapToScreen(val: 3)
        let square = Square(center: point1, side: radius, color: ColorPicker.randomColor())
        return square
    }

    var description: String { return "\(color.description) square: \(center.description), side \(side)" }
    var center: Point
    var side: Int
    var color: UIColor
}

func makeSquare(center: Point, side: Int, color: UIColor) -> Square {    
    return Square(center: mapToScreen(point: center, yOffset: 40), side: mapToScreen(val: side), color: color)
}

