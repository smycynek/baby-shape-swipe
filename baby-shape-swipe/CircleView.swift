import Foundation
import UIKit

final class CircleView: UIView {
    func initCircle() {
            let radius = getRandomRadiusInModelSpace();
            let margin = radius + 1;
            var points = getRandomModelPoints(count: 1, marginX: margin, marginY: margin);
            let center = points[0];
            self.circle = makeCircle(center: center, radius: radius, color: ColorPicker.randomColor(pastel: Settings.pastelColors))
     
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
        let context =  contextSetup(color: circle.color.cgColor)
        context.move(to: CGPoint(x: circle.center.x + circle.radius, y: circle.center.y))
        context.addArc(center:
            CGPoint(x: circle.center.x, y: circle.center.y),
                        radius: CGFloat (circle.radius),
                        startAngle: 0, endAngle: CGFloat(Double.pi * 2), clockwise: false)
              context.drawPath(using: CGPathDrawingMode.eoFillStroke)
        drawGridLines()
    }
    var circle = Circle.makeDefault();
}
