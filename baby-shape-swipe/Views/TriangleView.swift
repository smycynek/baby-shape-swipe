import Foundation
import UIKit

final class TriangleView: ShapeView {
    
    override func initShape() {
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
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
