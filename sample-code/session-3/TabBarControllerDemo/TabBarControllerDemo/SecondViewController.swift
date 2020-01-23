//
//  SecondViewController.swift
//  TabBarControllerDemo
//
//  Created by Susan Stevens on 1/22/20.
//  Copyright © 2020 Susan Stevens. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet var label: UILabel!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let formatter = DateFormatter()
        formatter.timeStyle = .long
        formatter.timeZone = TimeZone(abbreviation: "EST")
        label.text = formatter.string(from: Date())
    }


}

