import Foundation
import UIKit

enum NearlyDegenerateError: Error {
    case runtimeError(String)
}

// Quick check to make sure points don't line in a single line
// Calculates the area of the square that 2 tringles would make
// placed side to size.  If zero -- all points are in a line.
func nearlyDegenerate(vals: [Point]) -> Bool {
    let x1 = vals[0].x
    let y1 = vals[0].y
    let x2 = vals[1].x
    let y2 = vals[1].y
    let x3 = vals[2].x
    let y3 = vals[2].y
    
    let slope1 = Double((vals[0].y - vals[1].y))/(0.01 + Double(vals[0].x) - Double(vals[1].x))
    let slope2 = Double((vals[0].y - vals[2].y))/(0.01 + Double(vals[0].x) - Double(vals[2].x))
    let slope3 = Double((vals[1].y - vals[2].y))/(0.01 + Double(vals[1].x) - Double(vals[2].x))
    
    let delta1 = Double(abs((abs(slope1) - abs(slope2))))
    let delta2 = Double(abs((abs(slope1) - abs(slope3))))
    let delta3 = Double(abs((abs(slope3) - abs(slope2))))
    
    var slopeSimilar = false;
    if ((delta1 < 0.1) && (delta2 < 0.1) && (delta3 < 0.1)) {
        slopeSimilar = true;
    }
    let a = (x1 * (y2 - y3)) + (x2 * (y3 - y1)) + (x3 * (y1 - y2));

    return (Double(abs(a)) < 10) || slopeSimilar
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

func getScreenSizeInModelSpace() -> [[Int]] {
    
    let maxX = Int(UIScreen.main.bounds.maxX) - 2 * Constants.margin;
    let maxY = Int(UIScreen.main.bounds.maxY) - 2 * Constants.margin;

    let xc =  Int(Int(maxX) / Int(Constants.pointSpace))
    let yc = Int(Int(maxY) / Int(Constants.pointSpace))
    let xRemainder =  Int(Int(maxX) % Int(Constants.pointSpace))
    let yRemainder =  Int(Int(maxY) % Int(Constants.pointSpace))
    return [[Int](arrayLiteral: xc, yc), [Int](arrayLiteral: xRemainder, yRemainder)]
}

func getGridPoints(safeMarginX : Int=0, safeMarginY: Int=0) -> [Point] {
    var points = [Point]()
    let pointCount = getScreenSizeInModelSpace()[0]
    let xLower = 0 + safeMarginX
    let xUpper = pointCount[0] - safeMarginX
    let yLower = 0 + safeMarginY
    let yUpper = pointCount[1]-safeMarginY
    
    for ii in xLower...xUpper{
        for jj in yLower...yUpper {
            points.append(Point (x: ii, y: jj))
        }
    }
    return points
}

func getGridLines(safeMarginX : Int=0, safeMarginY: Int=0) -> [[Point]] {
    var linePoints = [[Point]]()
    let dimensions = getScreenSizeInModelSpace()
    for ii in 0+safeMarginX...dimensions[0][0]-safeMarginX {
        linePoints.append([Point(x:ii,y:0), Point(x:ii,y:dimensions[0][1])])
    }
    
    for jj in 0+safeMarginY...dimensions[0][1]-safeMarginY {
        linePoints.append([Point(x:0,y:jj), Point(x:dimensions[0][0],y:jj)])
    }
    
    return linePoints;
}

func drawGridLines(xOffset : Int=0, yOffset: Int=0) {
    if (Settings.drawGrid == true) {
        let context =  UIGraphicsGetCurrentContext();
        for gline in getGridLines() {
            let pointMapped1 = mapToScreen(point: gline[0], xOffset: xOffset, yOffset : yOffset)
            let pointMapped2 = mapToScreen(point: gline[1], xOffset: xOffset, yOffset : yOffset)
            
            let path = CGMutablePath()
            
            path.move(to: CGPoint(x: pointMapped1.x, y: pointMapped1.y))
            path.addLine(to: CGPoint(x: pointMapped2.x, y: pointMapped2.y))

       
            
            context?.addPath(path)
            
            context?.setLineWidth(1.0)
            let transparentGrey = UIColor(red:0.6, green:0.6, blue: 0.6, alpha:0.5)
            context?.setStrokeColor(transparentGrey.cgColor)
            context?.drawPath(using: CGPathDrawingMode.eoFillStroke)
        }
    }
    return
}



func getRandomRadiusInModelSpace() -> Int {

    let dimensions = getScreenSizeInModelSpace()
    let minDimension = dimensions[0].min()!
 
    let maxRadius = Int( minDimension/2)-1;
    
    var radius = (Int(arc4random_uniform(UInt32(maxRadius))));
    if (radius == 0 ) {
        radius = 1;
    }
    return radius
}

func getRandomSquareSideInModelSpace() -> Int {
    
    let dimensions = getScreenSizeInModelSpace()
    let minDimension = dimensions[0].min()!
    let maxSide = minDimension - 1;
    
    var side = (Int(arc4random_uniform(UInt32(maxSide))));
    if (side == 0 ) {
        side = 1;
    }
    return side
}

func getRandomRectangleSidesInModelSpace() -> [Int] {

    let dimensions = getScreenSizeInModelSpace()

    var sideX = (Int(arc4random_uniform(UInt32(dimensions[0][0]))));
    if (sideX == 0 ) {
        sideX = 1;
    }

    var sideY = (Int(arc4random_uniform(UInt32(dimensions[0][1]))));
    if (sideY == 0 ) {
        sideY = 1;
    }
    
    if (sideX == sideY)
    {
        sideX = 2
        sideY = 4
    }
    
    return [sideX, sideY]
}


func getRandomPointsWithinScreenInModelSpace(count: Int, margin: Int=0) -> [Point] {
    var dimensions = getScreenSizeInModelSpace()
    var points = [Point]()
    for _ in 1...count {
        let x = Int(arc4random_uniform(UInt32(dimensions[0][0])))
        let y = Int(arc4random_uniform(UInt32(dimensions[0][1])))
        points.append(Point(x: Int(x), y: Int(y)))
    }
    return points
}

func getRandomModelPoints(count: Int, marginX : Int=0, marginY : Int=0) -> [Point] {
    let gpoints = getGridPoints(safeMarginX: marginX, safeMarginY: marginY)
    
    var points = [Point]()
    for _ in 1...count {
        points.append(gpoints.randomElement()!)
    }
        return points
}



func getSafeFrame() -> CGRect {
    
    let dimensions = getScreenSizeInModelSpace()
    let xOffset = Int(dimensions[1][0]/2)
    let yOffset = Int(dimensions[1][1]/2)
    let frame = CGRect(x: Constants.margin + xOffset , y: Constants.margin + yOffset, width: Int(UIScreen.main.bounds.maxX) - 2*Constants.margin, height: Int(UIScreen.main.bounds.maxY) - 2*Constants.margin)
    return frame;
}

func getBackgroundFrame() -> CGRect {
    
 let frame = CGRect(x:0, y:0, width : UIScreen.main.bounds.maxX, height: UIScreen.main.bounds.maxY)
    return frame
}

func contextSetup(color: CGColor) -> CGContext {
    let context =  UIGraphicsGetCurrentContext();
    
    context?.setLineJoin(.round)
    context?.setLineCap(.butt)
    
    context?.setLineWidth(Constants.lineWidth)
    context?.setStrokeColor(UIColor.black.cgColor)
    context?.setFillColor(color)
    return context!
}
