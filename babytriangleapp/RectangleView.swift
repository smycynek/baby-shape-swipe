

import Foundation
import UIKit

final class RectangleVIew: UIView {
    
    func initRectangle() {
        do {
            var side1 = getRandomRadiusWIthinScreenInModelSpace();
            var side2 = getRandomRadiusWIthinScreenInModelSpace();
            
            var marginval = 0;
            print("Marginval");
            print(marginval);
            var points = getRandomSafeModelPoints(count: 1, margin: marginval);
            let center = points[0];
            
            
            
            
            try self.rectangle = makeRectangle(upperleftval: center, sideval1: side1, sideval2: side2, colorval: ColorPicker.randomColor())
            print (self.rectangle.description)
        }
        catch {
            self.rectangle = Rectangle.makeDefault()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.initRectangle();
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    var rectangle = Rectangle.makeDefault();
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        let context =  UIGraphicsGetCurrentContext();
        print(rectangle.description);
        
        
        context?.move(to: CGPoint(x: rectangle.upperleft.x, y: rectangle.upperleft.y))
        context?.addLine(to: CGPoint(x: rectangle.upperleft.x + rectangle.side1, y: rectangle.upperleft.y))
        context?.addLine(to: CGPoint(x: rectangle.upperleft.x + rectangle.side1, y: rectangle.upperleft.y + rectangle.side2))
        context?.addLine(to: CGPoint(x: rectangle.upperleft.x, y: rectangle.upperleft.y + rectangle.side2))
        context?.addLine(to: CGPoint(x: rectangle.upperleft.x, y: rectangle.upperleft.y))
        
        context?.setLineWidth(3.0)
        context?.setStrokeColor(UIColor.black.cgColor)
        context?.setFillColor(rectangle.color.cgColor)
        context?.drawPath(using: CGPathDrawingMode.eoFillStroke)
      
       
        

        
      //  CGContextMoveToPoint(context, centerX + radius*cos(startAngle), centerY + radius*sin(startAngle))
        
  
        
        drawGridPoints(offsetxval : 0, offsetyval : 40)
      
    }
}
