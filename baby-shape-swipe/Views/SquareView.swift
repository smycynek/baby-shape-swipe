import Foundation
import UIKit

final class SquareView: ShapeView {
    
    override func initShape() {
            let side = getRandomSquareSideInModelSpace();
        let margin = Int(side/2) + 1;
        var points = getRandomModelPoints(count: 1, marginX: margin, marginY: margin);
            let center = points[0];
        self.shape = makeScreenSpaceSquare(center: center, side: side, color: ColorPicker.randomColor(pastel: Settings.pastelColors))
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
