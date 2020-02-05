//
//  GesturesViewController.swift
//  Session4Demos
//
//  Created by Susan Stevens on 1/25/20.
//  Copyright © 2020 Susan Stevens. All rights reserved.
//

import UIKit

class GesturesViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self,
                                                          action: #selector(tap))
        tapGestureRecognizer.numberOfTapsRequired = 2
        view.addGestureRecognizer(tapGestureRecognizer)
    }
    
    @objc func tap(_ sender: UITapGestureRecognizer) {
        let location = sender.location(in: view)

        let flower = UIImageView(image: UIImage(imageLiteralResourceName: "flower"))
        flower.center = location
        view.addSubview(flower)
    }
    
    @IBAction func pan(_ sender: UIPanGestureRecognizer) {
        guard let groundhog = sender.view else { return }

        let translation = sender.translation(in: view)
        groundhog.frame.origin.x += translation.x
        groundhog.frame.origin.y += translation.y

        sender.setTranslation(CGPoint(x: 0, y: 0), in: view)
    }
    
    @IBAction func pinch(_ sender: UIPinchGestureRecognizer) {
        guard let groundhog = sender.view else { return }

        if sender.state == .changed {
            groundhog.transform = groundhog.transform.scaledBy(x: sender.scale,
                                                               y: sender.scale)
        }

        if sender.state == .ended {
            UIViewPropertyAnimator.runningPropertyAnimator(withDuration: 1.0,
                                                           delay: 0,
                                                           options: [.curveEaseIn],
                                                           animations: {
                groundhog.transform = CGAffineTransform.identity
            })
        }

        sender.scale = 1
    }
}
