//
//  TriangleView.swift
//  babytriangleapp
//
//  Created by Steven Mycynek on 11/15/18.
//  Copyright © 2018 Steven Mycynek. All rights reserved.
//

import Foundation
import UIKit

final class TriangleView: UIView {
    
    func initTriangle() {
        do {
            let points = getRandomSafeModelPoints(count : 3, margin: 1)
                //getRandomSafeModelPointgetRandomPointsWithinScreenInModelSpace(count: 3, margin:0)
            
            try self.triangle = makeTriangle(vals: points, colorval: ColorPicker.randomColor())
        }
        catch {
            self.triangle = Triangle.makeDefault()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.initTriangle();
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    var triangle = Triangle.makeDefault();
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        let context =  UIGraphicsGetCurrentContext();
        print(triangle.description);
        
        
        context?.move(to: CGPoint(x: triangle.p1.x, y: triangle.p1.y))
        context?.addLine(to: CGPoint(x: triangle.p2.x, y: triangle.p2.y))
        context?.addLine(to: CGPoint(x: triangle.p3.x, y: triangle.p3.y))
        context?.addLine(to: CGPoint(x: triangle.p1.x, y: triangle.p1.y))
        context?.setLineWidth(3.0)
        context?.setStrokeColor(UIColor.black.cgColor)
        context?.setFillColor(triangle.color.cgColor)
        context?.drawPath(using: CGPathDrawingMode.eoFillStroke)
        drawGridPoints(offsetxval: 0, offsetyval : 0)
    }
}
