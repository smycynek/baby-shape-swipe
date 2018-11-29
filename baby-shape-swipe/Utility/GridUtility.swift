import Foundation
import UIKit

func getModelSpaceGridPoints(safeMarginX: Int=0, safeMarginY: Int=0) -> [Point] {
    var points = [Point]()
    let pointCount = getModelDimensionAndScreenPlacementInfo()
    let xLower = 0 + safeMarginX
    let xUpper = pointCount.xLength - safeMarginX
    let yLower = 0 + safeMarginY
    let yUpper = pointCount.yLength-safeMarginY
    if (xLower >= xUpper) || (yLower >= yUpper) {
        points.append(Point(xParam: xLower, yParam: yLower))
    } else {
        for xIndex in xLower...xUpper {
            for jIndex in yLower...yUpper {
                points.append(Point (xParam: xIndex, yParam: jIndex))
            }
        }
    }
    return points
}

func getModelSpaceGridLines(safeMarginX: Int=0, safeMarginY: Int=0) -> [[Point]] {
    var linePoints = [[Point]]()
    let dimensions = getModelDimensionAndScreenPlacementInfo()
    for xIndex in 0+safeMarginX...dimensions.xLength-safeMarginX {
        linePoints.append([Point(xParam: xIndex, yParam: 0), Point(xParam: xIndex, yParam: dimensions.yLength)])
    }
    for yIndex in 0+safeMarginY...dimensions.yLength-safeMarginY {
        linePoints.append([Point(xParam: 0, yParam: yIndex), Point(xParam: dimensions.xLength, yParam: yIndex)])
    }
    return linePoints
}

func drawGridLines() {
    let context =  UIGraphicsGetCurrentContext()
    for gline in getModelSpaceGridLines() {
        let pointMapped1 = mapToScreen(gline[0])
        let pointMapped2 = mapToScreen(gline[1])
        let path = CGMutablePath()
        path.move(to: CGPoint(x: pointMapped1.xParam, y: pointMapped1.yParam))
        path.addLine(to: CGPoint(x: pointMapped2.xParam, y: pointMapped2.yParam))
        context?.addPath(path)
        context?.setLineWidth(1.0)
        let transparentGrey = UIColor(red: 0.6, green: 0.6, blue: 0.6, alpha: 0.5)
        context?.setStrokeColor(transparentGrey.cgColor)
        context?.drawPath(using: CGPathDrawingMode.eoFillStroke)
    }
    return
}
