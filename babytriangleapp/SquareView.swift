

import Foundation
import UIKit

final class CircleView: UIView {
    
    func initCircle() {
        do {
            var radius = getRandomRadiusWIthinScreenInModelSpace();
           
            
            var marginval = radius;
            print("Marginval");
            print(marginval);
            var points = getRandomSafeModelPoints(count: 1, margin: marginval);
            let center = points[0];
            
            
            
            
            try self.circle = makeCircle(centerval: center, radiusval: radius, colorval: ColorPicker.randomColor())
            print (self.circle.description)
        }
        catch {
            self.circle = Circle.makeDefault()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.initCircle();
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    var circle = Circle.makeDefault();
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        let context =  UIGraphicsGetCurrentContext();
       
        

        
      //  CGContextMoveToPoint(context, centerX + radius*cos(startAngle), centerY + radius*sin(startAngle))
        
        context?.move(to: CGPoint(x: circle.center.x + circle.radius, y: circle.center.y))

        context?.addArc(center:
            CGPoint(x: circle.center.x, y: circle.center.y),
                        radius: CGFloat (circle.radius),
                        startAngle: 0, endAngle: CGFloat(Double.pi * 2), clockwise: false)
        context?.setLineWidth(3.0)
        context?.setStrokeColor(UIColor.black.cgColor)
        context?.setFillColor(circle.color.cgColor)
        context?.drawPath(using: CGPathDrawingMode.eoFillStroke)
        
        drawGridPoints(offsetxval : 0, offsetyval : 40)
      
    }
}
