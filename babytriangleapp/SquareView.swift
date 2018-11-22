import Foundation
import UIKit

final class SquareView: UIView {
    
    func initSquare() {
            let side = getRandomSquareSideInModelSpace();
        let margin = Int(side/2) + 1;
        var points = getRandomModelPoints(count: 1, marginX: margin, marginY: margin);
            let center = points[0];
            self.square = makeSquare(center: center, side: side, color: ColorPicker.randomColor())
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.initSquare();
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        let context =  UIGraphicsGetCurrentContext();
        let offset = square.side/2
        context?.setLineJoin(.round)
        context?.setLineCap(.butt)
        
        let path = CGMutablePath()
        
      
         
        
        path.move(to: CGPoint(x: square.center.x - offset, y: square.center.y - offset))
        path.addLine(to: CGPoint(x: square.center.x + offset, y: square.center.y - offset))
        path.addLine(to: CGPoint(x: square.center.x + offset, y: square.center.y + offset))
        path.addLine(to: CGPoint(x: square.center.x - offset, y: square.center.y + offset))
        // path.addLine(to: CGPoint(x: square.center.x - offset, y: square.center.y - offset)) //not needed with close path
        path.closeSubpath()
        
        context?.addPath(path)
        
        context?.setLineWidth(Constants.lineWidth)
        context?.setStrokeColor(UIColor.black.cgColor)
        context?.setFillColor(square.color.cgColor)
        context?.drawPath(using: CGPathDrawingMode.eoFillStroke)
        drawGridPoints()      
    }
    var square = Square.makeDefault();
}
