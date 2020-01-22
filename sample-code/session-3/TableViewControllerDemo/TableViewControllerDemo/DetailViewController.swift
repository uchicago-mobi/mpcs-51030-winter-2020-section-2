//
//  DetailViewController.swift
//  TableViewControllerDemo
//
//  Created by Susan Stevens on 1/22/20.
//  Copyright © 2020 Susan Stevens. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet var label: UILabel!
    
    var time: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        label.text = time
    }
    
}
