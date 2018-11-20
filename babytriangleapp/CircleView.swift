import Foundation
import UIKit

final class CircleView: UIView {
    func initCircle() {
       
            let radius = getRandomRadiusWIthinScreenInModelSpace();
            let marginval = radius;
            var points = getRandomSafeModelPoints(count: 1, margin: marginval);
            let center = points[0];
            self.circle = makeCircle(center: center, radius: radius, color: ColorPicker.randomColor())
     
        }
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.initCircle();
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        let context =  UIGraphicsGetCurrentContext();
       
        context?.move(to: CGPoint(x: circle.center.x + circle.radius, y: circle.center.y))

        context?.addArc(center:
            CGPoint(x: circle.center.x, y: circle.center.y),
                        radius: CGFloat (circle.radius),
                        startAngle: 0, endAngle: CGFloat(Double.pi * 2), clockwise: false)
        context?.setLineWidth(3.0)
        context?.setStrokeColor(UIColor.black.cgColor)
        context?.setFillColor(circle.color.cgColor)
        context?.drawPath(using: CGPathDrawingMode.eoFillStroke)
        drawGridPoints(yOffset : 40)
    }
    var circle = Circle.makeDefault();
}
