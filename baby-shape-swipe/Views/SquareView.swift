import Foundation
import UIKit

final class SquareView: UIView {
    
    func initSquare() {
            let side = getRandomSquareSideInModelSpace();
        let margin = Int(side/2) + 1;
        var points = getRandomModelPoints(count: 1, marginX: margin, marginY: margin);
            let center = points[0];
        self.shape = makeScreenSpaceSquare(center: center, side: side, color: ColorPicker.randomColor(pastel: Settings.pastelColors))
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
        let context =  self.contextSetup(color: shape!.color.cgColor)
        let path = shape!.getPath()

        context?.addPath(path)
        context?.drawPath(using: CGPathDrawingMode.eoFillStroke)
        if (Settings.drawGrid == true) {
            drawGridLines()
        }
    }
    var shape : Square? = nil
}
