import Foundation
import UIKit

protocol Shape
{
     func getPath() -> CGMutablePath
     var color: UIColor { get set }
}
