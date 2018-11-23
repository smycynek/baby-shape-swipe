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
        let context =  contextSetup(color: square.color.cgColor)
        let path = CGMutablePath()
        let offset = square.side/2
        path.move(to: CGPoint(x: square.center.x - offset, y: square.center.y - offset))
        path.addLine(to: CGPoint(x: square.center.x + offset, y: square.center.y - offset))
        path.addLine(to: CGPoint(x: square.center.x + offset, y: square.center.y + offset))
        path.addLine(to: CGPoint(x: square.center.x - offset, y: square.center.y + offset))
        path.closeSubpath()
        context.addPath(path)
        context.drawPath(using: CGPathDrawingMode.eoFillStroke)
        drawGridLines()
    }
    var square = Square.makeDefault();
}
