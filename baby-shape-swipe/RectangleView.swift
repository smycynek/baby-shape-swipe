import Foundation
import UIKit

final class RectangleView: UIView {
    func initRectangle() {
            let sides =  getRandomRectangleSidesInModelSpace()
            let marginX = Int(sides[0]/2) + 1
            let marginY = Int(sides[1]/2) + 1
            var points = getRandomModelPoints(count: 1, marginX: marginX, marginY: marginY)
            let center = points[0];
        self.rectangle = makeRectangle(center: center,  side1 : sides[0], side2: sides[1], color: ColorPicker.randomColor(pastel: Settings.pastelColors))
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
        let context = contextSetup(color: rectangle.color.cgColor)
        let offsetx = rectangle.side1/2
        let offsety = rectangle.side2/2
        let path = CGMutablePath()
        path.move(to: CGPoint(x: rectangle.center.x - offsetx, y: rectangle.center.y - offsety))
        path.addLine(to: CGPoint(x: rectangle.center.x + offsetx, y: rectangle.center.y - offsety))
        path.addLine(to: CGPoint(x: rectangle.center.x + offsetx, y: rectangle.center.y + offsety))
        path.addLine(to: CGPoint(x: rectangle.center.x - offsetx, y: rectangle.center.y + offsety))
        path.closeSubpath()
        context.addPath(path)
        context.drawPath(using: CGPathDrawingMode.eoFillStroke)
        drawGridLines()
    }
    var rectangle = Rectangle.makeDefault();
}
