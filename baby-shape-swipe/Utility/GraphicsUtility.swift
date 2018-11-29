import Foundation
import UIKit

extension UIView {
    func contextSetup(color: CGColor) -> CGContext? {
        let context =  UIGraphicsGetCurrentContext()
        context?.setLineJoin(.round)
        context?.setLineCap(.butt)
        context?.setLineWidth(Constants.lineWidth)
        context?.setStrokeColor(UIColor.black.cgColor)
        context?.setFillColor(color)
        return context
    }
}
