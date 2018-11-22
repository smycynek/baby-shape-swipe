import Foundation
import UIKit

final class RectangleView: UIView {
    func initRectangle() {
    
            let side1 = getRandomRadiusWIthinScreenInModelSpace();
            let side2 = getRandomRadiusWIthinScreenInModelSpace();
            let marginval = 3;
            var points = getRandomSafeModelPoints(count: 1, margin: marginval);
            let center = points[0];
            self.rectangle = makeRectangle(center: center, side1: side1, side2: side2, color: ColorPicker.randomColor())
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.initRectangle();
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        let context =  UIGraphicsGetCurrentContext();
        context?.setLineJoin(.round)
        context?.setLineCap(.butt)
        let offsetx = rectangle.side1/2
        let offsety = rectangle.side2/2
      
        context?.move(to: CGPoint(x: rectangle.center.x - offsetx, y: rectangle.center.y - offsety))
        
        context?.addLine(to: CGPoint(x: rectangle.center.x + offsetx, y: rectangle.center.y - offsety))
        context?.addLine(to: CGPoint(x: rectangle.center.x + offsetx, y: rectangle.center.y + offsety))
        context?.addLine(to: CGPoint(x: rectangle.center.x - offsetx, y: rectangle.center.y + offsety))
        context?.addLine(to: CGPoint(x: rectangle.center.x - offsetx, y: rectangle.center.y - offsety))
        
        context?.setLineWidth(Constants.lineWidth)
        context?.setStrokeColor(UIColor.black.cgColor)
        context?.setFillColor(rectangle.color.cgColor)
        context?.drawPath(using: CGPathDrawingMode.eoFillStroke)
      
        drawGridPoints()
      
    }
    var rectangle = Rectangle.makeDefault();
}
