//
//  HomeViewController.swift
//  NavigationControllerDemo
//
//  Created by Susan Stevens on 1/20/20.
//  Copyright © 2020 Susan Stevens. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        var timeZone: String
        
        if segue.identifier == "central" {
            timeZone = "CST"
        } else {
            timeZone = "EST"
        }
        
        let destination = segue.destination as? TimeViewController
        let formatter = DateFormatter()
        formatter.timeStyle = .long
        formatter.timeZone = TimeZone(abbreviation: timeZone)
        destination?.time = formatter.string(from: Date())
    }
    
}

