import Foundation
import UIKit

class Triangle : Shape {
    init(p1val: Point, p2val: Point, p3val: Point, color: UIColor) {
        self.p1 = p1val
        self.p2 = p2val
        self.p3 = p3val
        self.color = color
    }
    
    static func makeScreenSpaceDefault() -> Triangle {
        let random : Int = [1,2,3].randomElement()!
        
        var point1 : Point? = nil;
        var point2 : Point? = nil;
        var point3 : Point? = nil;
        
        switch (random) {
        case 1:
            point1 = mapToScreen (point: Point(x:5, y:5))
            point2 = mapToScreen (point: Point(x:1, y:4))
            point3 = mapToScreen (point: Point(x:2, y:9))
            break;
        case 2:
            point1 = mapToScreen (point: Point(x:1, y:2))
            point2 = mapToScreen (point: Point(x:5, y:6))
            point3 = mapToScreen (point: Point(x:1, y:4))
            break;
        default:
            point1 = mapToScreen (point: Point(x:2, y:2))
            point2 = mapToScreen (point: Point(x:4, y:7))
            point3 = mapToScreen (point: Point(x:1, y:5))
        }

        let triangle = Triangle(p1val: point1!,
                            p2val: point2!,
                            p3val: point3!,
                            color: ColorPicker.randomColor(pastel: Settings.pastelColors)
                            )
        return triangle
    }
    
    func getPath() ->CGMutablePath {
        let path = CGMutablePath()
        path.move(to: CGPoint(x: self.p1.x, y: self.p1.y))
        path.addLine(to:  CGPoint(x: self.p2.x, y: self.p2.y))
        path.addLine(to: CGPoint(x: self.p3.x, y: self.p3.y))
        path.closeSubpath()
        return path
    }
    var description: String { return "\(color.description) triangle: \(p1.description), \(p2.description), \(p3.description)" }
    var p1: Point
    var p2: Point
    var p3: Point
    var color: UIColor
}

func makeScreenSpaceTriangle(vals: [Point], color: UIColor) throws -> Triangle {
    if nearlyDegenerate(vals: vals) {
        throw NearlyDegenerateError.runtimeError("Nearly degenerate triangle!")
    }
    let point1 = mapToScreen (point: vals[0])
    let point2 = mapToScreen (point: vals[1])
    let point3 = mapToScreen (point: vals[2])
    
    return Triangle(p1val: point1, p2val:point2, p3val:point3, color: color)
}
