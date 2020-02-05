//
//  ManualLayoutDemoViewController.swift
//  AutoLayoutDemo
//
//  Created by Susan Stevens on 2/2/20.
//  Copyright © 2020 Susan Stevens. All rights reserved.
//

import UIKit

class ManualLayoutDemoViewController: UIViewController {

    var view1: UIView!
    var view2: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view1 = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 100))
        
        view2 = UIView(frame: CGRect(x: view.frame.width / 2 - 50,
                                         y: view.frame.height / 2 - 50,
                                         width: 100,
                                         height: 100))
        
        view1.backgroundColor = .systemPink
        view2.backgroundColor = .systemBlue
        
        view.addSubview(view1)
        view.addSubview(view2)
    }
    
    override func viewWillLayoutSubviews() {
        view1.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 100)

        view2.frame = CGRect(x: view.frame.width / 2 - 50,
                             y: view.frame.height / 2 - 50,
                             width: 100,
                             height: 100)
    }
}
