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
    
    let locationManager = CLLocationManager()
    let id = MKMapViewDefaultAnnotationViewReuseIdentifier
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Request authorization and
        // set the view controller as the location manager's delegate
        locationManager.requestWhenInUseAuthorization()
        locationManager.delegate = self
        
        // Set the view controller as the map view's delegate
        mapView.delegate = self
        
        // Configure the map view
        mapView.pointOfInterestFilter = MKPointOfInterestFilter(including: [.restaurant, .movieTheater])
        mapView.showsCompass = true
        mapView.showsScale = true
        mapView.showsTraffic = true
        
        // Track the user's location on the map
        mapView.showsUserLocation = true
        mapView.userTrackingMode = .follow
        
        
        // Set the current region of the map.
        // Remember to disable this if you want to track the user's location.
//        let span = MKCoordinateSpan(latitudeDelta: 0.015, longitudeDelta: 0.015)
//        let region = MKCoordinateRegion(center: coordinate, span: span)
//        mapView.region = region
        
        // Register the annotation view
        mapView.register(MKMarkerAnnotationView.self, forAnnotationViewWithReuseIdentifier: id)
        
        // Add a new annotation every time the user long presses on the map
        let longPress = UILongPressGestureRecognizer(target: self, action: #selector(addAnnotation))
        mapView.addGestureRecognizer(longPress)
    }
    
    @objc func addAnnotation(_ sender: UILongPressGestureRecognizer) {
        if sender.state == .began {
            let annotation = MKPointAnnotation()
            let location = sender.location(in: mapView)
            annotation.coordinate = mapView.convert(location, toCoordinateFrom: mapView)
            annotation.title = "Favorite"
            annotation.subtitle = "One of my favorite places"
            mapView.addAnnotation(annotation)
        }
    }
}

extension ViewController: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView,
                 viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        
        // Return nil to use default annotation view for user's location
        if annotation is MKUserLocation { return nil }
        
        guard let annotationView = mapView.dequeueReusableAnnotationView(
            withIdentifier: id, for: annotation) as? MKMarkerAnnotationView else {
            return nil
        }
        
        // Configure annotation view differently if it represents a cluster of annotations
        if (annotation is MKClusterAnnotation) {
            annotationView.markerTintColor = .red
            annotationView.glyphText = "🌟"
        } else {
            annotationView.markerTintColor = .blue
            annotationView.glyphText = "⭐️"
        }
        
        annotationView.animatesWhenAdded = true
        annotationView.canShowCallout = true
        annotationView.leftCalloutAccessoryView = UIImageView(image: UIImage(systemName: "star.circle.fill"))
        
        // Enable clustering
        annotationView.displayPriority = .defaultHigh
        annotationView.clusteringIdentifier = "annotation"
        
        return annotationView
    }
}

extension ViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager,
                         didChangeAuthorization status: CLAuthorizationStatus) {
        switch status {
        case .authorizedAlways, .authorizedWhenInUse:
            print("Authorized!")
        case .notDetermined:
            print("We need to request authorization")
        default:
            print("Not authorized :(")
        }
    }
}

