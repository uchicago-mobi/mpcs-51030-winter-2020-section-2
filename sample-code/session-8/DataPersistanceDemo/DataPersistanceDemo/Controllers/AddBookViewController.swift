//
//  AddBookViewController.swift
//  DataPersistanceDemo
//
//  Created by Susan Stevens on 2/25/20.
//  Copyright © 2020 Susan Stevens. All rights reserved.
//

import UIKit

class AddBookViewController: UIViewController {

    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var authorTextField: UITextField!
    @IBOutlet weak var categorySegmentedControl: UISegmentedControl!
    
    var book: Book?
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        book = Book(title: titleTextField.text,
                    author: authorTextField.text,
                    category: BookCategory(rawValue: categorySegmentedControl.selectedSegmentIndex))
    }
}
