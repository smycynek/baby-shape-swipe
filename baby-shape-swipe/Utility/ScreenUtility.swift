import Foundation
import UIKit

func mapToScreen(_ point: Point) -> Point {
    let xScreen = point.xParam * Constants.pointSpace
    let yScreen = point.yParam * Constants.pointSpace
    return Point(xParam: xScreen, yParam: yScreen)
}

func mapToScreen(_ val: Int) -> Int {
    return (val * Constants.pointSpace)
}

func mapToModel(_ val: Int) -> Int {
    return (val / Constants.pointSpace)
}

func mapToModel(_ point: Point) -> Point {
    let xModel = point.xParam / Constants.pointSpace
    let yModel = point.yParam / Constants.pointSpace
    return Point(xParam: xModel, yParam: yModel)
}

func getModelDimensionAndScreenPlacementInfo() -> ModelDimensionInfo {
    var safeMarginTop: CGFloat?
    var safeMarginBottom: CGFloat?
    if #available(iOS 11.0, *) {
        let insets = UIApplication.shared.keyWindow?.safeAreaInsets
        safeMarginBottom = insets?.bottom
        safeMarginTop = insets?.top
    }
    var safeMarginTopVal = 20
    var safeMarginBottomVal = 54 // Toolbar height -- must abstract
    if safeMarginTop != nil {
        safeMarginTopVal = Int(safeMarginTop!)
    }

    if safeMarginBottom != nil {
        safeMarginBottomVal = Int(safeMarginBottom!) + 54 // Toolbar height -- must abstract
    }

    let maxX = Int(UIScreen.main.bounds.maxX) - 2 * Constants.leftRightMargins
    let maxY = Int(UIScreen.main.bounds.maxY) -
        (Constants.topMargin + Constants.bottomMargin + safeMarginTopVal + safeMarginBottomVal)
    let xSize =  Int(Int(maxX) / Int(Constants.pointSpace))
    let ySize = Int(Int(maxY) / Int(Constants.pointSpace))
    let xRemainder =  Int(Int(maxX) % Int(Constants.pointSpace))
    let yRemainder =  Int(Int(maxY) % Int(Constants.pointSpace))
    let dimensionInfo = ModelDimensionInfo(xLength: xSize, yLength: ySize, remainderX: xRemainder,
                                           remainderY: yRemainder, safeMarginTop: safeMarginTopVal, safeMarginBottom: safeMarginBottomVal)
    return dimensionInfo
}

func getSafeFrame() -> CGRect {
    let dimensions = getModelDimensionAndScreenPlacementInfo()
    let xOffset = Int(dimensions.remainderX/2)
    let yOffset = Int(dimensions.remainderY/2)
    let verticalSize = Int(UIScreen.main.bounds.maxY) -
        (Constants.topMargin + Constants.bottomMargin + dimensions.safeMarginBottom + dimensions.safeMarginTop)
    let frame = CGRect(x: Constants.leftRightMargins + xOffset ,
                       y: Constants.topMargin + yOffset + dimensions.safeMarginTop,
                       width: Int(UIScreen.main.bounds.maxX) - (2*Constants.leftRightMargins),
                       height: verticalSize)
    return frame
}
