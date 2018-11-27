//
//  Point.swift
//  baby-shape-swipe
//
//  Created by Steven Mycynek on 11/25/18.
//  Copyright © 2018 Steven Mycynek. All rights reserved.
//

import Foundation

class Point {
    init(x: Int, y: Int) {
        self.x = x
        self.y = y
    }
    var description: String { return "(\(x), \(y))" }
    var x: Int
    var y: Int
}
