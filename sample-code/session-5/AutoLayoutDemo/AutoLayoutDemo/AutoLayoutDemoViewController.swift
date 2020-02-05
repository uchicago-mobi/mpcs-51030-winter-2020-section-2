//
//  AutoLayoutDemoViewController.swift
//  AutoLayoutDemo
//
//  Created by Susan Stevens on 2/2/20.
//  Copyright © 2020 Susan Stevens. All rights reserved.
//

import UIKit

/**
 This class demonstrates three ways of creating Auto Layout constraints programmatically:
 - Using the NSLayoutConstraint initializer
 - Using NSLayoutAnchors
 - Using Visual Format Language (VFL)
 
 See Main.storyboard for an example of how to create Auto Layout constraints in Interface Builder.
 */
class AutoLayoutDemoViewController: UIViewController {
    
    var subview1: UIView!
    var subview2: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        subview1 = UIView()
        subview2 = UIView()
        
        /*
         Remember to disable translating autoresizing mask into constraints.
         This tells the system not to create any constraints automatically.
         */
        subview1.translatesAutoresizingMaskIntoConstraints = false
        subview2.translatesAutoresizingMaskIntoConstraints = false
        
        subview1.backgroundColor = .systemYellow
        subview2.backgroundColor = .systemTeal
        
        view.addSubview(subview1)
        view.addSubview(subview2)
        
        /*
         The three lines below demonstrate three ways of
         creating auto layout constraints programmatically.
         
         Only one line should be uncommented at a time.
         */
        NSLayoutConstraint.activate(constraintsUsingInitializer())
//        NSLayoutConstraint.activate(constraintsUsingAnchors())
//        NSLayoutConstraint.activate(constraintsUsingVisualFormatLanguage())
    }
    
    func constraintsUsingInitializer() -> [NSLayoutConstraint] {
        return [
            
            NSLayoutConstraint(item: subview1 as Any,
                               attribute: .top,
                               relatedBy: .equal,
                               toItem: view,
                               attribute: .top,
                               multiplier: 1,
                               constant: 0),
            
            NSLayoutConstraint(item: subview1 as Any,
                               attribute: .leading,
                               relatedBy: .equal,
                               toItem: view,
                               attribute: .leading,
                               multiplier: 1,
                               constant: 0),
            
            NSLayoutConstraint(item: subview1 as Any,
                               attribute: .trailing,
                               relatedBy: .equal,
                               toItem: view,
                               attribute: .trailing,
                               multiplier: 1,
                               constant: 0),
            
            NSLayoutConstraint(item: subview1 as Any,
                               attribute: .height,
                               relatedBy: .equal,
                               toItem: nil,
                               attribute: .notAnAttribute,
                               multiplier: 1,
                               constant: 100),
            
            NSLayoutConstraint(item: subview2 as Any,
                               attribute: .width,
                               relatedBy: .equal,
                               toItem: nil,
                               attribute: .notAnAttribute,
                               multiplier: 1,
                               constant: 100),
            
            NSLayoutConstraint(item: subview2 as Any,
                               attribute: .height,
                               relatedBy: .equal,
                               toItem: nil,
                               attribute: .notAnAttribute,
                               multiplier: 1,
                               constant: 100),
            
            NSLayoutConstraint(item: subview2 as Any,
                               attribute: .centerX,
                               relatedBy: .equal,
                               toItem: view,
                               attribute: .centerX,
                               multiplier: 1,
                               constant: 0),
            
            NSLayoutConstraint(item: subview2 as Any,
                               attribute: .centerY,
                               relatedBy: .equal,
                               toItem: view,
                               attribute: .centerY,
                               multiplier: 1,
                               constant: 0)
        ]
    }
    
    func constraintsUsingAnchors() -> [NSLayoutConstraint] {
        return [
            subview1.topAnchor.constraint(equalTo: view.topAnchor),
            subview1.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            subview1.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            subview1.heightAnchor.constraint(equalToConstant: 100),
            subview2.widthAnchor.constraint(equalToConstant: 100),
            subview2.heightAnchor.constraint(equalToConstant: 100),
            subview2.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            subview2.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ]
    }
    
    func constraintsUsingVisualFormatLanguage() -> [NSLayoutConstraint] {
        
        let views = ["subview1": subview1 as Any, "subview2": subview2 as Any, "view": view as Any]
        
        return [
            NSLayoutConstraint.constraints(withVisualFormat: "H:|[subview1]|", metrics: nil, views: views),
            NSLayoutConstraint.constraints(withVisualFormat: "V:|[subview1(100)]", metrics: nil, views: views),
            NSLayoutConstraint.constraints(withVisualFormat: "H:[view]-(<=1)-[subview2(100)]",
                                           options: .alignAllCenterY,
                                           metrics: nil,
                                           views: views),
            NSLayoutConstraint.constraints(withVisualFormat: "V:[view]-(<=1)-[subview2(100)]",
                                           options: .alignAllCenterX,
                                           metrics: nil,
                                           views: views)
        ].flatMap{$0}
    }
}
