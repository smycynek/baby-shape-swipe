import Foundation
import UIKit

enum ColinearError: Error {
    case runtimeError(String)
}

// Quick check to make sure points don't line in a single line
// Calculates the area of the square that 2 tringles would make
// placed side to size.  If zero -- all points are in a line.
func colinear(vals: [Point]) -> Bool {
    let x1 = vals[0].x
    let y1 = vals[0].y
    let x2 = vals[1].x
    let y2 = vals[1].y
    let x3 = vals[2].x
    let y3 = vals[2].y
    
    let a = (x1 * (y2 - y3)) + (x2 * (y3 - y1)) + (x3 * (y1 - y2));

    return (a==0)
}

class Point {
    init(x: Int, y: Int) {
        self.x = x
        self.y = y
    }
    var description: String { return "(\(x), \(y))" }
    var x: Int
    var y: Int
}

func mapToScreen(point: Point, xOffset: Int=0, yOffset: Int=0) -> Point {
    let x = point.x * Constants.pointSpace + xOffset
    let y = point.y * Constants.pointSpace + yOffset
    return Point(x : x, y: y)
}

func mapToScreen(val: Int, offset: Int=0) -> Int {
    return (val * Constants.pointSpace) + offset
}

func getPointCountsForScreenDimensions() -> [Int] {
    
    //let window = UIApplication.shared.keyWindow;
    //let topPadding = window?.safeAreaInsets.top;
    //let bottomPadding = window?.safeAreaInsets.bottom;
    //let rightpadding = window?.safeAreaInsets.right;
    //let leftPadding = window?.safeAreaInsets.left;
    
    let maxX = UIScreen.main.bounds.maxX;
    let maxY = UIScreen.main.bounds.maxY;
    
    let xc =  Int(Int(maxX) / Int(Constants.pointSpace))
    let yc = Int(Int(maxY) / Int(Constants.pointSpace))
    return [Int](arrayLiteral: xc, yc)
}

func getGridPoints(safeMargin : Int=0) -> [Point] {
    var points = [Point]()
    let pointCount = getPointCountsForScreenDimensions()
    for ii in 0+safeMargin...pointCount[0]-safeMargin{
        for jj in 0+safeMargin...pointCount[1]-safeMargin {
            points.append(Point (x: ii, y: jj))
        }
    }
    return points
}

func drawGridPoints(xOffset : Int=0, yOffset: Int=0) {
    if (Settings.drawGrid == true) {
    let context =  UIGraphicsGetCurrentContext();
    for gpoint in getGridPoints(safeMargin: 0) {
        let pointMapped = mapToScreen(point: gpoint, xOffset: xOffset, yOffset : yOffset)

        context?.move(to: CGPoint (x: pointMapped.x, y: pointMapped.y))
        
        context?.addArc(center: CGPoint (x: pointMapped.x, y: pointMapped.y), radius: 1, startAngle: 0, endAngle: 6.28, clockwise: true)
        context?.setLineWidth(3.0)
        context?.setFillColor(UIColor.blue.cgColor)
        context?.setStrokeColor(UIColor.black.cgColor)
        context?.drawPath(using: CGPathDrawingMode.eoFillStroke)
        }
    }
    return
}
func getRandomRadiusWIthinScreenInModelSpace() -> Int {

    let pointCount = getPointCountsForScreenDimensions()
    let minCount = pointCount.min()!
 
    let upperBound = Int( minCount/2);
    
    var rad = (Int(arc4random_uniform(UInt32(upperBound))));
    if (rad == 0 ) {
        rad +=  1
    }
    return rad
}

func getRandomPointsWithinScreenInModelSpace(count: Int, margin: Int=0) -> [Point] {
    var pointCounts = getPointCountsForScreenDimensions()
    var points = [Point]()
    for _ in 1...count {
        let x = Int(arc4random_uniform(UInt32(pointCounts[0])))
        let y = Int(arc4random_uniform(UInt32(pointCounts[1])))
        points.append(Point(x: Int(x), y: Int(y)))
    }
    return points
}

func getRandomSafeModelPoints(count: Int, margin : Int=0) -> [Point] {
    let gpoints = getGridPoints(safeMargin: margin)
    var points = [Point]()
    for _ in 1...count {
        points.append(gpoints.randomElement()!)
    }
        return points
}

