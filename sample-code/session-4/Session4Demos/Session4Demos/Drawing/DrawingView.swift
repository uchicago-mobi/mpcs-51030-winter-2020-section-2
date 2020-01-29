//
//  DrawingView.swift
//  Session4Demos
//
//  Created by Susan Stevens on 1/25/20.
//  Copyright © 2020 Susan Stevens. All rights reserved.
//

import UIKit

class DrawingView: UIView {

    override func draw(_ rect: CGRect) {
        let width = rect.width
        let height = rect.height
        
        // Draw dashed horizontal lines
        let lines = UIBezierPath()
        
        lines.move(to: CGPoint(x: 0, y: height / 4))
        lines.addLine(to: CGPoint(x: width, y: height / 4))
        
        lines.move(to: CGPoint(x: 0, y: 3 * height / 4))
        lines.addLine(to: CGPoint(x: width, y: 3 * height / 4))
        
        lines.setLineDash([10, 5], count: 2, phase: 0)
        lines.lineWidth = 5
        lines.stroke()
        
        // Draw a circle
        let circle = UIBezierPath(ovalIn: CGRect(x: width / 2 - 100,
                                                 y: height / 2 - 100,
                                                 width: 200,
                                                 height: 200))

        UIColor.white.setFill()
        circle.fill()

        UIColor.purple.setStroke()
        circle.lineWidth = 10
        circle.stroke()

        // Draw an arc
        let arcCenter = CGPoint(x: width / 2, y: height / 2)
        let arc = UIBezierPath(arcCenter: arcCenter,
                               radius: 130,
                               startAngle: 0,
                               endAngle: CGFloat.pi * 3/2,
                               clockwise: true)

        UIColor.black.setStroke()
        arc.lineWidth = 12
        arc.lineCapStyle = .round
        arc.stroke()
    }
}
