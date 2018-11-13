import Foundation
import UIKit


enum Color : UInt32 {
    case red, blue, green, orange, yellow, purple, white
    
    //Calculate size of enum
    private static let _enumSize: Color.RawValue = {
        var max: UInt32 = 0
        while let _ = Color(rawValue: max) {
            max += 1
        }
        return max
    }()
    
    static func randomColor() -> Color {
        let rand = arc4random_uniform(_enumSize)
        return Color(rawValue: rand)!
    }
    
    static func Value(colorval: Color) -> [CGFloat] {
        if (colorval == Color.red) {
             return [1,0,0,1]
        }
        else if colorval == Color.green {
             return [0,1,0,1]
        }
        else if colorval == Color.white {
            return [1,1,1,1]
        }
        else if colorval == Color.blue {
            return [0,0,1,1]
        }
        else if colorval == Color.orange {
            return [1,0.65,0,1]
        }
        else if colorval == Color.yellow {
            return [1,1,0,1]
        }
        else  {
            return [1,0,1,1]
        }

      
    }
    
}


// Random points for triangle generation
func randomPoints(count: Int, upperbound: Int) -> [Int] {
    var vals = [Int]()
    for _ in 1...count {
        vals.append(Int(arc4random_uniform(UInt32(upperbound+1))))
    }
    return vals
}

enum ColinearError: Error {
    case runtimeError(String)
}

// Quick check to make sure points don't line in a single line
// Calculates the area of the square that 2 tringles would make
// placed side to size.  If zero -- all points are in a line.
func colinear(vals: [Int]) -> Bool {
    let x1 = vals[0] //5
    let y1 = vals[1]  //5
    let x2 = vals[2] // 5
    let y2 = vals[3] // 5
    let x3 = vals[4]// 7
    let y3 = vals[5] //7
    
    let a = (x1 * (y2 - y3)) + (x2 * (y3 - y1)) + (x3 * (y1 - y2));
    let eq = ((x1 == x2) && (y1 == y2)) || ((x1 == x3) && (y1 == y3))  || ((x3 == x2) && (y3 == y2))
    return (a==0) || (eq == true)
}

class Point {
    init(xval: Int, yval: Int) {
        x = xval
        y = yval
    }
    var description: String { return "(\(x), \(y))" }
    var x: Int
    var y: Int
}

class Triangle {
    init(p1val: Point, p2val: Point, p3val: Point, colorval: Color) {
        p1 = p1val
        p2 = p2val
        p3 = p3val
        color = colorval
    }
    
    static func makeDefault() -> Triangle {
        
        let point1 = Point(xval: mapToScreenX(val: 1), yval: mapToScreenY(val: 1))
        let point2 = Point(xval: mapToScreenX(val: 4), yval: mapToScreenY(val: 4))
        let point3 = Point(xval: mapToScreenX(val: 1), yval: mapToScreenY(val: 4))
        
        let triangle = Triangle(p1val: point1,
                            p2val: point2,
                            p3val: point3,
                            colorval: Color.randomColor()
                            )
        
        return triangle

    }
    
    var description: String { return "\(color) triangle: \(p1.description), \(p2.description), \(p3.description)" }
    var p1: Point
    var p2: Point
    var p3: Point
    var color: Color
}


// Make a triangle from an array of six integers and a color value
// Reject input and throw exception if points are colinear

func mapToScreenX(val: Int) -> Int {
    
    let maxX = UIScreen.main.bounds.maxX;
    let multiplier = Int (maxX/5);
    return (val * multiplier) + 40;
    
}

func mapToScreenY(val: Int) -> Int {
    let maxY = UIScreen.main.bounds.maxY;
    let multiplier = Int (maxY/5);
    return (val * multiplier) + 40;
    
}

func makeTriangle(vals: [Int], colorval: Color) throws -> Triangle {
    if colinear(vals: vals) {
        print("Colinear!")
        throw ColinearError.runtimeError("Colinear!")
    }
    let p1 =  Point(xval: mapToScreenX(val: vals[0]), yval: mapToScreenY(val: vals[1]))
    let p2 =  Point(xval: mapToScreenX(val: vals[2]), yval: mapToScreenY(val: vals[3]))
    let p3 =  Point(xval: mapToScreenX(val: vals[4]), yval: mapToScreenY(val: vals[5]))
    
    return Triangle(p1val: p1, p2val:p2, p3val:p3, colorval: colorval)
}

