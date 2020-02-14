//
//  ViewController.swift
//  RestaurantReviews
//
//  Created by Susan Stevens on 2/17/19.
//  Copyright © 2019 Susan Stevens. All rights reserved.
//

import UIKit

class ViewController: UIViewController, RatingControlDelegate {
    
    @IBOutlet var label: UILabel!
    @IBOutlet var ratingControl: RatingControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ratingControl.delegate = self
    }
    
    func ratingControl(_ control: RatingControl, didSelectRating rating: Int) {
        switch rating {
        case 0: label.text = "Awful"
        case 1: label.text = "Pretty bad"
        case 2: label.text = "Just okay"
        case 3: label.text = "Good"
        case 4: label.text = "Amazing"
        default: break
        }
    }
}


