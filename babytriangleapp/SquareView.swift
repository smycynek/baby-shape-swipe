import Foundation
import UIKit

final class SquareView: UIView {
    
    func initSquare() {
            let side = getRandomRadiusWIthinScreenInModelSpace();
            let margin = side;
            var points = getRandomSafeModelPoints(count: 1, margin: margin);
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
        context?.move(to: CGPoint(x: square.center.x - offset, y: square.center.y - offset))
        context?.addLine(to: CGPoint(x: square.center.x + offset, y: square.center.y - offset))
        context?.addLine(to: CGPoint(x: square.center.x + offset, y: square.center.y + offset))
        context?.addLine(to: CGPoint(x: square.center.x - offset, y: square.center.y + offset))
        context?.addLine(to: CGPoint(x: square.center.x - offset, y: square.center.y - offset))
        
        context?.setLineWidth(3.0)
        context?.setStrokeColor(UIColor.black.cgColor)
        context?.setFillColor(square.color.cgColor)
        context?.drawPath(using: CGPathDrawingMode.eoFillStroke)

        drawGridPoints()      
    }
    var square = Square.makeDefault();
}
