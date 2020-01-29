//
//  LayersView.swift
//  Session4Demos
//
//  Created by Susan Stevens on 1/25/20.
//  Copyright © 2020 Susan Stevens. All rights reserved.
//

import UIKit

class LayersView: UIView {

    override func awakeFromNib() {
        super.awakeFromNib()
        
        layer.backgroundColor = UIColor.purple.cgColor
        layer.cornerRadius = 20
        layer.borderColor = UIColor.darkGray.cgColor
        layer.borderWidth = 5
        
        layer.shadowOpacity = 0.5
        layer.shadowRadius = 3
        layer.shadowOffset = CGSize(width: 5, height: 5)

        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = bounds
        gradientLayer.colors = [UIColor.blue.cgColor,
                                UIColor.white.cgColor]

        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 1)
        gradientLayer.cornerRadius = 20
        layer.addSublayer(gradientLayer)
    }
}
