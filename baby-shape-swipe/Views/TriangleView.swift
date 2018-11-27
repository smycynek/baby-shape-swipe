import Foundation
import UIKit

final class TriangleView: UIView {
    
    func initShape() {
        do {
            let points = getRandomModelPoints(count : 3, marginX: 1, marginY: 1)            
            try self.shape = makeScreenSpaceTriangle(vals: points, color: ColorPicker.randomColor(pastel: Settings.pastelColors))
        }
        catch {
            self.shape = Triangle.makeScreenSpaceDefault()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.initShape();
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        let context =  self.contextSetup(color: shape!.color.cgColor);
        let path = shape!.getPath()
        context?.addPath(path)
        context?.drawPath(using: CGPathDrawingMode.eoFillStroke)
        if (Settings.drawGrid == true) {
            drawGridLines()
        }
    }
    var shape : Triangle? = nil;
    
}
