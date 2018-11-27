import Foundation
import UIKit

class ModelDimensionInfo {
    init (xLength : Int, yLength: Int, remainderX: Int, remainderY : Int, safeMarginTop: Int, safeMarginBottom: Int) {
        self.xLength = xLength;
        self.yLength = yLength;
        self.remainderX = remainderX;
        self.remainderY = remainderY;
        self.safeMarginTop = safeMarginTop
        self.safeMarginBottom = safeMarginBottom

    }
    var description: String {return "xLength: \(xLength), yLength: \(yLength), remainderX: \(remainderX), remainderY: \(remainderY)"}
    var xLength : Int;
    var yLength : Int;
    var remainderX : Int;
    var remainderY : Int;
    var safeMarginTop :   Int;
    var safeMarginBottom : Int;

}
