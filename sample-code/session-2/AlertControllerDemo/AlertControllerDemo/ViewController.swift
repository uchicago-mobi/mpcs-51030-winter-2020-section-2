import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Initialize the button.
        let button = UIButton(type: .system)
        
        // Set the button's frame.
        button.frame = CGRect(x: (view.bounds.width / 2) - 100,
                              y: (view.bounds.height / 2) - 15,
                              width: 200,
                              height: 30)
        
        // Set some of the button's title properties.
        button.titleLabel?.textAlignment = .center
        button.setTitle("Change Background Color", for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        
        // Add the target and action for the "touch up inside" event.
        button.addTarget(self,
                         action: #selector(changeBackgroundColor(_:)),
                         for: .touchUpInside)
        
        // Add the button to the view.
        view.addSubview(button)
    }
    
    @objc func changeBackgroundColor(_ sender: UIButton) {

        // Initialize the alert controller.
        let alertController = UIAlertController(title: "Background Color",
                                                message: "Select a new background color.",
                                                preferredStyle: .actionSheet)

        // Initialize the "Red" action.
        let redAction = UIAlertAction(title: "Red", style: .default) { _ in
            self.view.backgroundColor = .systemRed
        }

        // Initialize the "Blue" action.
        let blueAction = UIAlertAction(title: "Blue", style: .default) { _ in
            self.view.backgroundColor = .systemBlue
        }

        // Initialize the "Green" action.
        let greenAction = UIAlertAction(title: "Green", style: .default) { _ in
            self.view.backgroundColor = .systemGreen
        }

        // Initialize the "Cancel" action. Notice that the closure is omitted.
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)

        // Add each action to the alert controller.
        alertController.addAction(redAction)
        alertController.addAction(blueAction)
        alertController.addAction(greenAction)
        alertController.addAction(cancelAction)

        // Show the alert controller on screen.
        present(alertController, animated: true)
    }
}
