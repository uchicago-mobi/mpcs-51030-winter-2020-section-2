//
//  Animations1ViewController.swift
//  Session4Demos
//
//  Created by Susan Stevens on 1/25/20.
//  Copyright © 2020 Susan Stevens. All rights reserved.
//

import UIKit

class Animations1ViewController: UIViewController {

    @IBOutlet var pinkView: UIView!
    @IBOutlet var tealView: UIView!

    @IBAction func tappedAnimate(_ sender: UIButton) {
        
        // simple animation using UIView.animate
        UIView.animate(withDuration: 1.0, delay: 0.25, options: [.curveEaseIn], animations: {
            self.pinkView.alpha = 0.1
        }, completion: { _ in
            print("animation complete")
        })
        
        // animation using property animation
        let animator = UIViewPropertyAnimator(duration: 1.0, curve: .easeOut) {
            self.tealView.transform = CGAffineTransform(scaleX: 1.25, y: 1.25)
        }
        
        animator.addAnimations {
            self.tealView.backgroundColor = UIColor.systemPurple
        }
        
        animator.addCompletion { _ in
            self.tealView.transform = .identity
            self.tealView.backgroundColor = UIColor.systemTeal
        }
            
        animator.startAnimation()
    }
}
