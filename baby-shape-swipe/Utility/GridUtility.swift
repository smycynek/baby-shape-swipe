
import Foundation
import UIKit



func getModelSpaceGridPoints(safeMarginX : Int=0, safeMarginY: Int=0) -> [Point] {
    var points = [Point]()
    let pointCount = getModelDimensionAndScreenPlacementInfo()
    let xLower = 0 + safeMarginX
    let xUpper = pointCount.xLength - safeMarginX
    let yLower = 0 + safeMarginY
    let yUpper = pointCount.yLength-safeMarginY
    
    if (( (xLower >= xUpper) || (yLower >= yUpper) )) {
        points.append(Point(x: xLower, y: yLower))
    }
    else {
        for ii in xLower...xUpper{
            for jj in yLower...yUpper {
                points.append(Point (x: ii, y: jj))
            }
        }
    }
    return points
}

func getModelSpaceGridLines(safeMarginX : Int=0, safeMarginY: Int=0) -> [[Point]] {
    var linePoints = [[Point]]()
    let dimensions = getModelDimensionAndScreenPlacementInfo()
    for ii in 0+safeMarginX...dimensions.xLength-safeMarginX {
        linePoints.append([Point(x:ii,y:0), Point(x:ii,y:dimensions.yLength)])
    }
    for jj in 0+safeMarginY...dimensions.yLength-safeMarginY {
        linePoints.append([Point(x:0,y:jj), Point(x:dimensions.xLength,y:jj)])
    }
    return linePoints;
}

func drawGridLines(xOffset : Int=0, yOffset: Int=0) {
    let context =  UIGraphicsGetCurrentContext();
    for gline in getModelSpaceGridLines() {
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
    return
}
