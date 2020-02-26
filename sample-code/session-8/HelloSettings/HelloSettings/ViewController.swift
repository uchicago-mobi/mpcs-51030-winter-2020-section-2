//
//  ViewController.swift
//  HelloSettings
//
//  Created by Susan Stevens on 3/1/19.
//  Copyright © 2019 Susan Stevens. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        displaySettings()
        
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(displaySettings),
            name: UserDefaults.didChangeNotification,
            object: nil)
    }
    
    @objc func displaySettings() {
        let defaults = UserDefaults.standard
        
        let text = defaults.string(forKey: UserDefaultsKey.text.rawValue)
        let shouldFlipColors = defaults.bool(forKey: UserDefaultsKey.shouldFlipColors.rawValue)
        let fontSize = defaults.double(forKey: UserDefaultsKey.fontSize.rawValue)
        let colorId = defaults.string(forKey: UserDefaultsKey.colorId.rawValue)
        
        label.text = text
        label.font = UIFont.systemFont(ofSize: CGFloat(fontSize), weight: .medium)
        
        let selectedColor = UIColor(named: colorId ?? "teal")
        
        if shouldFlipColors {
            label.textColor = selectedColor
            button.titleLabel?.textColor = selectedColor
            view.backgroundColor = UIColor.white
        } else {
            label.textColor = UIColor.white
            button.titleLabel?.textColor = UIColor.white
            view.backgroundColor = selectedColor
        }
    }
    
    @IBAction func openSettingsApp(_ sender: Any) {
        if let settingsUrl = URL(string: UIApplication.openSettingsURLString) {
            UIApplication.shared.open(settingsUrl)
        }
    }
}
