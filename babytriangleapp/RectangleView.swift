

import Foundation
import UIKit

final class RectangleVIew: UIView {
    
    func initRectangle() {
        do {
            var side1 = getRandomRadiusWIthinScreenInModelSpace();
            var side2 = getRandomRadiusWIthinScreenInModelSpace();
            
            var marginval = 3;
     
            var points = getRandomSafeModelPoints(count: 1, margin: marginval);
            let center = points[0];
            
            
            
            
            try self.rectangle = makeRectangle(centerval: center, sideval1: side1, sideval2: side2, colorval: ColorPicker.randomColor())
        
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
    
        var offsetx = rectangle.side1/2
        var offsety = rectangle.side2/2
        
        
        context?.move(to: CGPoint(x: rectangle.upperleft.x - offsetx, y: rectangle.upperleft.y - offsety))
        
        context?.addLine(to: CGPoint(x: rectangle.upperleft.x + offsetx, y: rectangle.upperleft.y - offsety))
        context?.addLine(to: CGPoint(x: rectangle.upperleft.x + offsetx, y: rectangle.upperleft.y + offsety))
        context?.addLine(to: CGPoint(x: rectangle.upperleft.x - offsetx, y: rectangle.upperleft.y + offsety))
        context?.addLine(to: CGPoint(x: rectangle.upperleft.x - offsetx, y: rectangle.upperleft.y - offsety))
        
        context?.setLineWidth(3.0)
        context?.setStrokeColor(UIColor.black.cgColor)
        context?.setFillColor(rectangle.color.cgColor)
        context?.drawPath(using: CGPathDrawingMode.eoFillStroke)
      
       
  
        
        drawGridPoints(offsetxval : 0, offsetyval : 40)
      
    }
}
