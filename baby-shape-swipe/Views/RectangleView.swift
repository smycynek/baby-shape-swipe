import Foundation
import UIKit

final class RectangleView: UIView {
    func initRectangle() {
            let sides =  getRandomRectangleSidesInModelSpace()
            let marginX = Int(sides[0]/2) + 1
            let marginY = Int(sides[1]/2) + 1
            var points = getRandomModelPoints(count: 1, marginX: marginX, marginY: marginY)
            let center = points[0];
        self.shape = makeScreenSpaceRectangle(center: center,  side1 : sides[0], side2: sides[1], color: ColorPicker.randomColor(pastel: Settings.pastelColors))
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
        let context = self.contextSetup(color: shape!.color.cgColor)
        let path = shape!.getPath()
        context?.addPath(path)
        context?.drawPath(using: CGPathDrawingMode.eoFillStroke)
        if (Settings.drawGrid == true) {
            drawGridLines()
        }
    }
    var shape : Rectangle? = nil
}
