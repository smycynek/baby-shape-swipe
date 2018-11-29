import Foundation
import UIKit

class Triangle: Shape {
    init(point1: Point, point2: Point, point3: Point, color: UIColor) {
        self.point1 = point1
        self.point2 = point2
        self.point3 = point3
        self.color = color
    }
    static func makeScreenSpaceDefault() -> Triangle {
        let random: Int = [1, 2, 3].randomElement()!
        var point1: Point?
        var point2: Point?
        var point3: Point?
        switch random {
        case 1:
            point1 = mapToScreen (Point(xParam: 5, yParam: 5))
            point2 = mapToScreen (Point(xParam: 1, yParam: 4))
            point3 = mapToScreen (Point(xParam: 2, yParam: 9))
        case 2:
            point1 = mapToScreen (Point(xParam: 1, yParam: 2))
            point2 = mapToScreen (Point(xParam: 5, yParam: 6))
            point3 = mapToScreen (Point(xParam: 1, yParam: 4))
        default:
            point1 = mapToScreen (Point(xParam: 2, yParam: 2))
            point2 = mapToScreen (Point(xParam: 4, yParam: 7))
            point3 = mapToScreen (Point(xParam: 1, yParam: 5))
        }

        let triangle = Triangle(point1: point1!,
                            point2: point2!,
                            point3: point3!,
                            color: ColorPicker.randomColor(pastel: Settings.pastelColors)
                            )
        return triangle
    }
    func getPath() -> CGMutablePath {
        let path = CGMutablePath()
        path.move(to: CGPoint(x: self.point1.xParam, y: self.point1.yParam))
        path.addLine(to: CGPoint(x: self.point2.xParam, y: self.point2.yParam))
        path.addLine(to: CGPoint(x: self.point3.xParam, y: self.point3.yParam))
        path.closeSubpath()
        return path
    }
    var description: String {
        let description =
        """
        triangle: p1: \(mapToModel(point1).description),
        p2: \(mapToModel(point2).description),
        p3: \(mapToModel(point3).description)
        """
        return description
    }
    var point1: Point
    var point2: Point
    var point3: Point
    var color: UIColor
}

func makeScreenSpaceTriangle(vals: [Point], color: UIColor) throws -> Triangle {
    if nearlyDegenerate(vals: vals) {
        throw NearlyDegenerateError.runtimeError("Nearly degenerate triangle!")
    }
    let point1 = mapToScreen (vals[0])
    let point2 = mapToScreen (vals[1])
    let point3 = mapToScreen (vals[2])
    return Triangle(point1: point1, point2: point2, point3: point3, color: color)
}
