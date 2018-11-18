import Foundation
import UIKit


class Rectangle {
    init(centerval: Point, sideval1: Int, sideval2: Int, colorval: UIColor) {
        side1 = sideval1;
        side2 = sideval2
        upperleft = centerval
        color = colorval
    }
    

    static func makeDefault() -> Rectangle {
        
        let point1 = mapToScreen (point: Point(xval:3, yval:3), offsetx: 0, offsety: 40)
        let side1 = mapToScreen(val: 3, offset : 0)
        let side2 = mapToScreen(val: 5, offset : 0)
        
        let rectangle = Rectangle(centerval: point1, sideval1: side1, sideval2: side2, colorval: ColorPicker.randomColor())
                        
        
        return rectangle
        
    }

    

    var description: String { return "\(color.description) rectangle: \(upperleft.description), side1 \(side2) side2 \(side2)" }
    var upperleft: Point
    var side1: Int
    var side2: Int
    var color: UIColor
}



func makeRectangle(centerval: Point, sideval1: Int, sideval2: Int, colorval: UIColor) -> Rectangle {
   
    
    
    return Rectangle(centerval: mapToScreen(point: centerval, offsetx: 0, offsety: 40),
                     sideval1: mapToScreen(val: sideval1, offset : 0),
                     
                     sideval2: mapToScreen(val: sideval2, offset : 0),
                     
                     colorval: colorval)
}

