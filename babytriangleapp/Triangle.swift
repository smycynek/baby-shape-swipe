import Foundation
import UIKit


class Triangle {
    init(p1val: Point, p2val: Point, p3val: Point, colorval: UIColor) {
        p1 = p1val
        p2 = p2val
        p3 = p3val
        color = colorval
    }
    
    static func makeDefault() -> Triangle {
        
        let point1 = mapToScreen (point: Point(xval:1, yval:1), offsetx: 0, offsety : 0)
        let point2 = mapToScreen (point: Point(xval:4, yval:4), offsetx: 0, offsety : 0)
        let point3 = mapToScreen (point: Point(xval:1, yval:4), offsetx: 0, offsety: 0)
        
        let triangle = Triangle(p1val: point1,
                            p2val: point2,
                            p3val: point3,
                            colorval: ColorPicker.randomColor()
                            )
        return triangle

    }
    
    var description: String { return "\(color.description) triangle: \(p1.description), \(p2.description), \(p3.description)" }
    var p1: Point
    var p2: Point
    var p3: Point
    var color: UIColor
}


// Make a triangle from an array of six integers and a color value
// Reject input and throw exception if points are colinear


func makeTriangle(vals: [Point], colorval: UIColor) throws -> Triangle {
    if colinear(vals: vals) {
        throw ColinearError.runtimeError("Colinear!")
    }
    let point1 = mapToScreen (point: vals[0], offsetx: 0, offsety : 0)
    let point2 = mapToScreen (point: vals[1], offsetx: 0, offsety : 0)
    let point3 = mapToScreen (point: vals[2], offsetx: 0, offsety :0)
    
    return Triangle(p1val: point1, p2val:point2, p3val:point3, colorval: colorval)
}

