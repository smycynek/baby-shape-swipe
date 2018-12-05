import Foundation
import UIKit

class ShapeView: UIView {
    func initShape() {
        preconditionFailure("This method must be overridden")
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.initShape()
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
        print(shape!.description)
        if Settings.grid == true {
            drawGridLines()
        }
    }
    var shape: Shape?
}
