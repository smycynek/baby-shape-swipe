import Foundation

class Point {
    init(xParam: Int, yParam: Int) {
        self.xParam = xParam
        self.yParam = yParam
    }
    var description: String { return "(\(xParam), \(yParam))" }
    var xParam: Int
    var yParam: Int
}
