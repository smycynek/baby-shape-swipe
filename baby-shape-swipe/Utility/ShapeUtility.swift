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
    var slopeSimilar = false
    if (delta1 < 0.1) && (delta2 < 0.1) && (delta3 < 0.1) {
        slopeSimilar = true
    }
    let area = (x1 * (y2 - y3)) + (x2 * (y3 - y1)) + (x3 * (y1 - y2))
    return (Double(abs(area)) < 10) || slopeSimilar
}

func getRandomRadiusInModelSpace() -> Int {
    let dimensions = getModelDimensionAndScreenPlacementInfo()
    let minDimension = min(dimensions.xLength, dimensions.yLength)
    let maxRadius = Int( minDimension/2)
    let radius = (1...maxRadius-1).randomElement()!
    return radius
}

func getRandomSquareSideInModelSpace() -> Int {
    let dimensions = getModelDimensionAndScreenPlacementInfo()
    let minDimension = min(dimensions.xLength, dimensions.yLength)
    let maxSide = minDimension - 1
    let side = (1...maxSide-1).randomElement()!
    return side
}

func getRandomRectangleSidesInModelSpace() -> [Int] {
    let dimensions = getModelDimensionAndScreenPlacementInfo()
    let sideXValues = makeRangeSet(lowerBound: 1, upperBound: dimensions.xLength-1)
    let sideX = sideXValues.randomElement()!
    var sideYValues = makeRangeSet(lowerBound: 1, upperBound: dimensions.yLength-1)
    sideYValues.remove(sideX)
    let sideY = sideYValues.randomElement()!
    return [sideX, sideY]
}

func getRandomModelPoints(count: Int, marginX: Int=0, marginY: Int=0) -> [Point] {
    let gridPoints = getModelSpaceGridPoints(safeMarginX: marginX, safeMarginY: marginY)
    var randomPoints = [Point]()
    for _ in 1...count {
        randomPoints.append(gridPoints.randomElement()!)
    }
    return randomPoints
}
func makeRangeSet(lowerBound: Int, upperBound: Int) -> Set<Int> {
    var rangeSet = Set<Int>()
    let intRange = lowerBound...upperBound
    for intItem in intRange {
        rangeSet.insert(intItem)
    }
    return rangeSet
}
