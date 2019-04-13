import Foundation
import UIKit

class ShapeView: UIView, CAAnimationDelegate {
    func initShape() {
        preconditionFailure("This method must be overridden")
    }
    override init(frame: CGRect) {
        self.animationInProgress = false
        super.init(frame: frame)
        self.initShape()

    }
    required init?(coder: NSCoder) {
        self.animationInProgress = false
        super.init(coder: coder)
    }
    func touchAnimate() {
        self.animationInProgress = true
        let animationLayer = getTouchAnimationLayer()
        self.animation = animationLayer
        self.layer.addSublayer(animationLayer)
    }
    func getTouchAnimationLayer() -> CAShapeLayer {
        let layer = CAShapeLayer()
        layer.path = shape!.getPath()
        self.layer.addSublayer(layer)
        layer.strokeEnd = 0
        layer.lineWidth = 5
        layer.strokeColor = UIColor.black.cgColor
        layer.fillColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 0.5).cgColor
        layer.lineJoin = .round
        layer.lineCap = .butt
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.toValue = 1
        animation.duration = 5 // seconds
        animation.autoreverses = false
        animation.repeatCount = 1
        animation.delegate = self
        layer.add(animation, forKey: "line")
        return layer
    }
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        let context =  self.contextSetup(color: shape!.color.cgColor)
        let path = shape!.getPath()
        context?.addPath(path)
        context?.drawPath(using: CGPathDrawingMode.eoFillStroke)
        print(shape!.description)
        if Settings.grid == true {
            drawGridLines()
        }
    }
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        self.animation?.removeFromSuperlayer()
        self.animationInProgress = false
    }
    var animation: CALayer?
    var shape: Shape?
    var animationInProgress: Bool
}
