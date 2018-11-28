import Foundation
import UIKit

final class RectangleView: ShapeView {
    override func initShape() {
            let sides =  getRandomRectangleSidesInModelSpace()
            let marginX = Int(sides[0]/2) + 1
            let marginY = Int(sides[1]/2) + 1
            var points = getRandomModelPoints(count: 1, marginX: marginX, marginY: marginY)
            let center = points[0];
        self.shape = makeScreenSpaceRectangle(center: center,  side1 : sides[0], side2: sides[1], color: ColorPicker.randomColor(pastel: Settings.pastelColors))
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
