//
//  AddBookViewController.swift
//  DataPersistanceDemo
//
//  Created by Susan Stevens on 2/25/20.
//  Copyright © 2020 Susan Stevens. All rights reserved.
//

import UIKit

class AddBookViewController: UITableViewController {

    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var authorTextField: UITextField!
    @IBOutlet weak var categorySegmentedControl: UISegmentedControl!
    @IBOutlet var validationLabel: UILabel!
    
    var book: Book?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Dismiss the keyboard when the user drags down
        tableView.keyboardDismissMode = .interactive
        
        titleTextField.delegate = self
        authorTextField.delegate = self
        validationLabel.isHidden = true
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        tableView.addGestureRecognizer(tapGestureRecognizer)
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if identifier == "Save" {
            book = Book(title: titleTextField.text,
                        author: authorTextField.text,
                        category: BookCategory(rawValue: categorySegmentedControl.selectedSegmentIndex))
            validationLabel.isHidden = book != nil
            return book != nil
        } else {
            return true
        }
    }
    
    @objc func handleTap(_ sender: UITapGestureRecognizer) {
        // Dismiss the keyboard when the user taps away from a text field
        tableView.endEditing(true)
    }
}

extension AddBookViewController: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        validationLabel.isHidden = true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // Dismiss the keyboard when the user taps "Return"
        return textField.resignFirstResponder()
    }
}
