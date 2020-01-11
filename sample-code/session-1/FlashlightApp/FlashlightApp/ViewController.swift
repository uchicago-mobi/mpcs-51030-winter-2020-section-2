//
//  ViewController.swift
//  FlashlightApp
//
//  Created by Susan Stevens on 1/8/20.
//  Copyright © 2020 Susan Stevens. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var lightOn: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }

    @IBAction func buttonPressed(_ sender: Any) {
        lightOn.toggle()
        updateUI()
    }
    
    func updateUI() {
        if lightOn {
            view.backgroundColor = UIColor.white
        } else {
            view.backgroundColor = UIColor.black
        }
    }
}

