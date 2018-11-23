import Foundation
import UIKit

enum ColinearError: Error {
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
    
    print("deltas")
    print(delta1)
    print(delta2)
    print(delta3)
    var slopeSimilar = false;
    if ((delta1 < 0.1) && (delta1 < 0.1) && (delta3 < 0.1)) {
        slopeSimilar = true;
    }
    let a = (x1 * (y2 - y3)) + (x2 * (y3 - y1)) + (x3 * (y1 - y2));
    print("area")
    print(abs(a))
    //return (a == 0)
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

func getScreenSizeInModelSpace() -> [Int] {
    
    let maxX = Int(UIScreen.main.bounds.maxX) - 2 * Constants.margin;
    let maxY = Int(UIScreen.main.bounds.maxY) - 2 * Constants.margin;
    
    let xc =  Int(Int(maxX) / Int(Constants.pointSpace))
    let yc = Int(Int(maxY) / Int(Constants.pointSpace))
    //print("Screen-X-Max " + String(xc))
    //print("Screen-Y-Max " + String(yc))
    return [Int](arrayLiteral: xc, yc)
}

func getGridPoints(safeMarginX : Int=0, safeMarginY: Int=0) -> [Point] {
    var points = [Point]()
    let pointCount = getScreenSizeInModelSpace()
    for ii in 0+safeMarginX...pointCount[0]-safeMarginX{
        for jj in 0+safeMarginY...pointCount[1]-safeMarginY {
            points.append(Point (x: ii, y: jj))
        }
    }
    return points
}

func getGridLines(safeMarginX : Int=0, safeMarginY: Int=0) -> [[Point]] {
    var points = [[Point]]()
    let dimensions = getScreenSizeInModelSpace()
    for ii in 0+safeMarginX...dimensions[0]-safeMarginX {
        points.append([Point(x:ii,y:0), Point(x:ii,y:dimensions[1])])
    }
    
    for jj in 0+safeMarginY...dimensions[1]-safeMarginY {
        points.append([Point(x:0,y:jj), Point(x:dimensions[0],y:jj)])
    }
    
return points;
}


func drawGridPoints(xOffset : Int=0, yOffset: Int=0) {
    if (Settings.drawGrid == true) {
    let context =  UIGraphicsGetCurrentContext();
    for gpoint in getGridPoints() {
        let pointMapped = mapToScreen(point: gpoint, xOffset: xOffset, yOffset : yOffset)

        context?.move(to: CGPoint (x: pointMapped.x, y: pointMapped.y))
        
        context?.addArc(center: CGPoint (x: CGFloat(pointMapped.x),
                                         y: CGFloat(pointMapped.y)),
                                         radius: CGFloat(2),
                                         startAngle: CGFloat(0),
                                         endAngle: CGFloat(Double.pi * 2),
                                         clockwise: true)
        context?.setLineWidth(2.0)
        context?.setFillColor(UIColor.blue.cgColor)
        context?.setStrokeColor(UIColor.black.cgColor)
        context?.drawPath(using: CGPathDrawingMode.eoFillStroke)
        }
    }
    return
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
    let minDimension = dimensions.min()!
 
    let maxRadius = Int( minDimension/2)-1;
    
    var radius = (Int(arc4random_uniform(UInt32(maxRadius))));
    if (radius == 0 ) {
        radius = 1;
    }
    return radius
}

func getRandomSquareSideInModelSpace() -> Int {
    
    let dimensions = getScreenSizeInModelSpace()
    let minDimension = dimensions.min()!
    let maxSide = minDimension - 1;
    
    var side = (Int(arc4random_uniform(UInt32(maxSide))));
    if (side == 0 ) {
        side = 1;
    }
    return side
}

func getRandomRectangleSidesInModelSpace() -> [Int] {

    let dimensions = getScreenSizeInModelSpace()

    var sideX = (Int(arc4random_uniform(UInt32(dimensions[0]))));
    if (sideX == 0 ) {
        sideX = 1;
    }

    var sideY = (Int(arc4random_uniform(UInt32(dimensions[1]))));
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
    var pointCounts = getScreenSizeInModelSpace()
    var points = [Point]()
    for _ in 1...count {
        let x = Int(arc4random_uniform(UInt32(pointCounts[0])))
        let y = Int(arc4random_uniform(UInt32(pointCounts[1])))
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
    let frame = CGRect(x: Constants.margin + 8 , y: Constants.margin + 4, width: Int(UIScreen.main.bounds.maxX) - 2*Constants.margin, height: Int(UIScreen.main.bounds.maxY) - 2*Constants.margin)
    return frame;
}

func getBackgroundFrame() -> CGRect {
    
 let frame = CGRect(x:0, y:0, width : UIScreen.main.bounds.maxX, height: UIScreen.main.bounds.maxY)
    return frame
}

