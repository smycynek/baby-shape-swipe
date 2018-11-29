//
//  Point.swift
//  baby-shape-swipe
//
//  Created by Steven Mycynek on 11/25/18.
//  Copyright © 2018 Steven Mycynek. All rights reserved.
//

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
