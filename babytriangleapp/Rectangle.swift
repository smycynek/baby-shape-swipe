import Foundation
import UIKit


class Rectangle {
    init(center: Point, side1: Int, side2: Int, color: UIColor) {
        self.side1 = side1
        self.side2 = side2
        self.center = center
        self.color = color
    }
    
    static func makeDefault() -> Rectangle {
        let point1 = mapToScreen (point: Point(x:3, y:3))
        let side1 = mapToScreen(val: 3)
        let side2 = mapToScreen(val: 5)
        let rectangle = Rectangle(center: point1, side1: side1, side2: side2, color: ColorPicker.randomColor())
        return rectangle
    }

    var description: String { return "\(color.description) rectangle: \(center.description), side1 \(side2) side2 \(side2)" }
    var center: Point
    var side1: Int
    var side2: Int
    var color: UIColor
}

func makeRectangle(center: Point, side1: Int, side2: Int, color: UIColor) -> Rectangle {
    return Rectangle(center: mapToScreen(point: center),
                     side1: mapToScreen(val: side1),
                     side2: mapToScreen(val: side2),
                     color: color)
}

