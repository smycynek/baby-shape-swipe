import Foundation
import UIKit

func mapToScreen(point: Point, xOffset: Int=0, yOffset: Int=0) -> Point {
    let x = point.x * Constants.pointSpace + xOffset
    let y = point.y * Constants.pointSpace + yOffset
    return Point(x : x, y: y)
}

func mapToScreen(val: Int, offset: Int=0) -> Int {
    return (val * Constants.pointSpace) + offset
}

func getModelDimensionAndScreenPlacementInfo() -> ModelDimensionInfo {
  
    var safeMarginTop : CGFloat? = nil
    var safeMarginBottom : CGFloat? = nil

    if #available(iOS 11.0, *) {
        let insets = UIApplication.shared.keyWindow?.safeAreaInsets
        safeMarginBottom = insets?.bottom
        safeMarginTop = insets?.top
    }
    var safeMarginTopVal = 20;
    var safeMarginBottomVal = 0;
    
    if (safeMarginTop != nil) {
        safeMarginTopVal = Int(safeMarginTop!)
    }

    if (safeMarginBottom != nil) {
        safeMarginBottomVal = Int(safeMarginBottom!)
    }

    
    let maxX = Int(UIScreen.main.bounds.maxX) - 2 * Constants.leftRightMargins;
    let maxY = Int(UIScreen.main.bounds.maxY) -
        (Constants.topMargin + Constants.bottomMargin + safeMarginTopVal + safeMarginBottomVal);
    
    let xc =  Int(Int(maxX) / Int(Constants.pointSpace))
    let yc = Int(Int(maxY) / Int(Constants.pointSpace))
    let xRemainder =  Int(Int(maxX) % Int(Constants.pointSpace))
    let yRemainder =  Int(Int(maxY) % Int(Constants.pointSpace))
    
    let dimensionInfo = ModelDimensionInfo(xLength: xc, yLength: yc, remainderX: xRemainder, remainderY: yRemainder, safeMarginTop :  safeMarginTopVal, safeMarginBottom : safeMarginBottomVal)
    return dimensionInfo
}



func getSafeFrame() -> CGRect {
    
    let dimensions = getModelDimensionAndScreenPlacementInfo()
    let xOffset = Int(dimensions.remainderX/2)
    let yOffset = Int(dimensions.remainderY/2)
    let verticalSize = Int(UIScreen.main.bounds.maxY) - (Constants.topMargin + Constants.bottomMargin + dimensions.safeMarginBottom + dimensions.safeMarginTop)
    let frame = CGRect(x: Constants.leftRightMargins + xOffset ,
                       y: Constants.topMargin + yOffset + dimensions.safeMarginTop,
                       width: Int(UIScreen.main.bounds.maxX) - (2*Constants.leftRightMargins),
                       height: verticalSize)
    return frame;
}

func getBackgroundFrame() -> CGRect {
    
    let frame = CGRect(x:0, y:0, width : UIScreen.main.bounds.maxX, height: UIScreen.main.bounds.maxY)
    return frame
}
