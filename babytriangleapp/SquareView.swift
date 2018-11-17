

import Foundation
import UIKit

final class SquareView: UIView {
    
    func initSquare() {
        do {
            var radius = getRandomRadiusWIthinScreenInModelSpace();
           
            
            var marginval = radius;
            print("Marginval");
            print(marginval);
            var points = getRandomSafeModelPoints(count: 1, margin: marginval);
            let center = points[0];
            
            
            
            
            try self.square = makeSquare(upperleftval: center, sideval: radius, colorval: ColorPicker.randomColor())
            print (self.square.description)
        }
        catch {
            self.square = Square.makeDefault()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.initSquare();
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    var square = Square.makeDefault();
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        let context =  UIGraphicsGetCurrentContext();
        print(square.description);
        
        
        context?.move(to: CGPoint(x: square.upperleft.x, y: square.upperleft.y))
        context?.addLine(to: CGPoint(x: square.upperleft.x + square.side, y: square.upperleft.y))
        context?.addLine(to: CGPoint(x: square.upperleft.x + square.side, y: square.upperleft.y + square.side))
        context?.addLine(to: CGPoint(x: square.upperleft.x, y: square.upperleft.y + square.side))
        context?.addLine(to: CGPoint(x: square.upperleft.x, y: square.upperleft.y))
        
        context?.setLineWidth(3.0)
        context?.setStrokeColor(UIColor.black.cgColor)
        context?.setFillColor(square.color.cgColor)
        context?.drawPath(using: CGPathDrawingMode.eoFillStroke)
      
       
        

        
      //  CGContextMoveToPoint(context, centerX + radius*cos(startAngle), centerY + radius*sin(startAngle))
        
  
        
        drawGridPoints(offsetxval : 0, offsetyval : 40)
      
    }
}
