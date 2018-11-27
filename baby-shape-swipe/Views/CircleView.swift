import Foundation
import UIKit

final class CircleView: UIView {
    func initCircle() {
            let radius = getRandomRadiusInModelSpace();
            let margin = radius + 1;
            var points = getRandomModelPoints(count: 1, marginX: margin, marginY: margin);
            let center = points[0];
            self.shape = makeScreenSpaceCircle(center: center, radius: radius, color: ColorPicker.randomColor(pastel: Settings.pastelColors))
     
        }
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.initCircle();
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        let context =  self.contextSetup(color: shape!.color.cgColor)
        let path = shape!.getPath()
        context?.addPath(path)
          context?.drawPath(using: CGPathDrawingMode.eoFillStroke)
        
        if (Settings.drawGrid == true) {
            drawGridLines()
        }
    }
     var shape : Circle? = nil;
}
