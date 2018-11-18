//
//  Utility.swift
//  babytriangleapp
//
//  Created by Steven Mycynek on 11/14/18.
//  Copyright © 2018 Steven Mycynek. All rights reserved.
//

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
    init(xval: Int, yval: Int) {
        x = xval
        y = yval
    }
    var description: String { return "(\(x), \(y))" }
    var x: Int
    var y: Int
}



func mapToScreen(point: Point, offsetx: Int, offsety: Int) -> Point {
    let x = point.x * Constants.pointSpace + offsetx
    let y = point.y * Constants.pointSpace + offsety
    return Point(xval : x, yval: y)
}

func mapToScreen(val: Int, offset: Int) -> Int {
    return (val * Constants.pointSpace) + offset

}

func getPointCountsForScreenDimensions() -> [Int] {
    let maxX = UIScreen.main.bounds.maxX
    let maxY = UIScreen.main.bounds.maxY-40
    
    let xc =  Int(Int(maxX) / Int(Constants.pointSpace))
    let yc = Int(Int(maxY) / Int(Constants.pointSpace))
    return [Int](arrayLiteral: xc, yc)
}

func getGridPoints(savemargin : Int) -> [Point] {
    var points = [Point]()
    let pointCount = getPointCountsForScreenDimensions()
    for ii in 0+savemargin...pointCount[0]-savemargin{
        for jj in 0+savemargin...pointCount[1]-savemargin {
            points.append(Point (xval: ii, yval: jj))
        }
    }
    return points
}



func drawGridPoints(offsetxval : Int, offsetyval: Int) {
    if (Constants.drawGrid == true) {
    let context =  UIGraphicsGetCurrentContext();
    for gpoint in getGridPoints(savemargin: 0) {
        let point_mapped = mapToScreen(point: gpoint, offsetx: offsetxval, offsety : offsetyval)

        context?.move(to: CGPoint (x: point_mapped.x, y: point_mapped.y))
        
        context?.addArc(center: CGPoint (x: point_mapped.x, y: point_mapped.y), radius: 1, startAngle: 0, endAngle: 6.28, clockwise: true)
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
  
    
    var minCount = pointCount.min()!
 
    let upperBound = Int( minCount/2) + 1;
    
    var rad = (Int(arc4random_uniform(UInt32(upperBound))));
    if (rad == 0 )
    {
        
        rad +=  1
    }
    return rad

}

func getRandomPointsWithinScreenInModelSpace(count: Int, margin: Int) -> [Point] {
    var pointCounts = getPointCountsForScreenDimensions()
    var points = [Point]()

    
    for _ in 1...count {
        
      
        var x = Int(arc4random_uniform(UInt32(pointCounts[0])))
        var y = Int(arc4random_uniform(UInt32(pointCounts[1])))
    
        
        
        points.append(Point(xval: Int(x), yval: Int(y)))
    }
    return points
}


func getRandomSafeModelPoints(count: Int, margin : Int) -> [Point] {
    let gpoints = getGridPoints(savemargin: margin)
    
    
    var points = [Point]()
    
    for _ in 1...count {
        points.append(gpoints.randomElement()!)
    }
        return points
    }

