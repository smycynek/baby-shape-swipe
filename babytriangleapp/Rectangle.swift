import Foundation
import UIKit


class Square {
    init(upperleftval: Point, sideval: Int, colorval: UIColor) {
        side = sideval;
        upperleft = upperleftval
        color = colorval
    }
    

    static func makeDefault() -> Square {
        
        let point1 = mapToScreen (point: Point(xval:3, yval:3), offsetx: 0, offsety: 40)
        let radius1 = mapToScreen(val: 3, offset : 0)
        let square = Square(upperleftval: point1, sideval: radius1, colorval: ColorPicker.randomColor())
                        
        
        return square
        
    }

    

    var description: String { return "\(color.description) square: \(upperleft.description), side \(side)" }
    var upperleft: Point
    var side: Int
    var color: UIColor
}



func makeSquare(upperleftval: Point, sideval: Int, colorval: UIColor) -> Square {
    
    return Square(upperleftval: mapToScreen(point: upperleftval, offsetx: 0, offsety: 40), sideval: mapToScreen(val: sideval, offset : 0), colorval: colorval)
}

