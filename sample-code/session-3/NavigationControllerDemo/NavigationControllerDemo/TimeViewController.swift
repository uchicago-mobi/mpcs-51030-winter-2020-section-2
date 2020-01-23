//
//  TimeViewController.swift
//  NavigationControllerDemo
//
//  Created by Susan Stevens on 1/20/20.
//  Copyright © 2020 Susan Stevens. All rights reserved.
//

import UIKit

class TimeViewController: UIViewController {
    
    @IBOutlet var timeLabel: UILabel!
    
    var time: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        timeLabel.text = time
    }
    
}
