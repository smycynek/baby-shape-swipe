

import Foundation
import UIKit

final class SquareView: UIView {
    
    func initSquare() {
        do {
            var radius = getRandomRadiusWIthinScreenInModelSpace();
           
            
            var marginval = radius;
            var points = getRandomSafeModelPoints(count: 1, margin: marginval);
            let center = points[0];
            
            
            
            
            try self.square = makeSquare(centerval: center, sideval: radius, colorval: ColorPicker.randomColor())
         
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
  
        
        let offset = square.side/2
        context?.move(to: CGPoint(x: square.center.x - offset, y: square.center.y - offset))
        context?.addLine(to: CGPoint(x: square.center.x + offset, y: square.center.y - offset))
        context?.addLine(to: CGPoint(x: square.center.x + offset, y: square.center.y + offset))
        context?.addLine(to: CGPoint(x: square.center.x - offset, y: square.center.y + offset))
        context?.addLine(to: CGPoint(x: square.center.x - offset, y: square.center.y - offset))
        
        context?.setLineWidth(3.0)
        context?.setStrokeColor(UIColor.black.cgColor)
        context?.setFillColor(square.color.cgColor)
        context?.drawPath(using: CGPathDrawingMode.eoFillStroke)
      
       
        

        
      //  CGContextMoveToPoint(context, centerX + radius*cos(startAngle), centerY + radius*sin(startAngle))
        
  
        
        drawGridPoints(offsetxval : 0, offsetyval : 40)
      
    }
}
