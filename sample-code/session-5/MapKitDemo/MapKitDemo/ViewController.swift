//
//  ViewController.swift
//  MapKitDemo
//
//  Created by Susan Stevens on 2/4/20.
//  Copyright © 2020 Susan Stevens. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController {

    @IBOutlet var mapView: MKMapView!
    
    let coordinate = CLLocationCoordinate2D(latitude: 40.730846,
                                            longitude: -73.997373)

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

