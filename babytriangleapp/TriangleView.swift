import Foundation
import UIKit

final class TriangleView: UIView {
    
    func initTriangle() {
        do {
            let points = getRandomModelPoints(count : 3)            
            try self.triangle = makeTriangle(vals: points, color: ColorPicker.randomColor())
        }
        catch {
            self.triangle = Triangle.makeDefault()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.initTriangle();
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        let context =  UIGraphicsGetCurrentContext();
        context?.setLineJoin(.round)
        context?.setLineCap(.butt)
        
        let path = CGMutablePath()
        path.move(to: CGPoint(x: triangle.p1.x, y: triangle.p1.y))
        
         path.addLine(to:  CGPoint(x: triangle.p2.x, y: triangle.p2.y))
         path.addLine(to: CGPoint(x: triangle.p3.x, y: triangle.p3.y))
         // path.addLine(to: CGPoint(x: triangle.p1.x, y: triangle.p1.y)) // not needed with close path
         path.closeSubpath()
        context?.addPath(path)
        
        context?.setLineWidth(Constants.lineWidth)
        context?.setStrokeColor(UIColor.black.cgColor)
        context?.setFillColor(triangle.color.cgColor)
        context?.drawPath(using: CGPathDrawingMode.eoFillStroke)
        //drawGridPoints()
        drawGridLines()
    }
    var triangle = Triangle.makeDefault();
}
