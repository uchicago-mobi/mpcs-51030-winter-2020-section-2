//
//  AutoresizingDemoViewController.swift
//  AutoLayoutDemo
//
//  Created by Susan Stevens on 2/2/20.
//  Copyright © 2020 Susan Stevens. All rights reserved.
//

import UIKit

class AutoresizingDemoViewController: UIViewController {
    
    var view1: UIView!
    var view2: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view1 = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 100))
        
        view2 = UIView(frame: CGRect(x: view.frame.width / 2 - 50,
                                         y: view.frame.height / 2 - 50,
                                         width: 100,
                                         height: 100))
        
        view1.backgroundColor = .systemGreen
        view2.backgroundColor = .systemOrange
        
        view1.autoresizingMask = [.flexibleBottomMargin, .flexibleWidth]
        view2.autoresizingMask = [.flexibleLeftMargin,
                                  .flexibleRightMargin,
                                  .flexibleTopMargin,
                                  .flexibleBottomMargin]
        
        view.addSubview(view1)
        view.addSubview(view2)
    }
}
