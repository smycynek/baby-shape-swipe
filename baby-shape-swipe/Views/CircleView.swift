import Foundation
import UIKit

final class CircleView: ShapeView {
    override func initShape() {
            let radius = getRandomRadiusInModelSpace()
            let margin = radius + 1
            var points = getRandomModelPoints(count: 1, marginX: margin, marginY: margin)
            let center = points[0]
            self.shape = makeScreenSpaceCircle(center: center, radius: radius, color: ColorPicker.randomColor(pastel: Settings.pastelColors))
        }
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
