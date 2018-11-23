import Foundation
import UIKit

class Triangle {
    init(p1val: Point, p2val: Point, p3val: Point, color: UIColor) {
        self.p1 = p1val
        self.p2 = p2val
        self.p3 = p3val
        self.color = color
    }
    
    static func makeDefault() -> Triangle {
        let point1 = mapToScreen (point: Point(x:1, y:1))
        let point2 = mapToScreen (point: Point(x:4, y:4))
        let point3 = mapToScreen (point: Point(x:1, y:4))
        let triangle = Triangle(p1val: point1,
                            p2val: point2,
                            p3val: point3,
                            color: ColorPicker.randomColor()
                            )
        return triangle
    }
    
    var description: String { return "\(color.description) triangle: \(p1.description), \(p2.description), \(p3.description)" }
    var p1: Point
    var p2: Point
    var p3: Point
    var color: UIColor
}

func makeTriangle(vals: [Point], color: UIColor) throws -> Triangle {
    if nearlyDegenerate(vals: vals) {
        throw ColinearError.runtimeError("Colinear!")
    }
    let point1 = mapToScreen (point: vals[0])
    let point2 = mapToScreen (point: vals[1])
    let point3 = mapToScreen (point: vals[2])
    
    return Triangle(p1val: point1, p2val:point2, p3val:point3, color: color)
}
