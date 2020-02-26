//
//  BooksTableViewController.swift
//  DataPersistanceDemo
//
//  Created by Susan Stevens on 2/25/20.
//  Copyright © 2020 Susan Stevens. All rights reserved.
//

import UIKit

class BooksTableViewController: UITableViewController {
    
    private var books: [Book] = []
    private var storageMethod: BookService.StorageMethod = .userDefaults
    
    override func viewDidLoad() {
        super.viewDidLoad()
        books = BookService.sharedInstance.fetchBooks(with: storageMethod)
        tableView.reloadData()
    }
    
    @IBAction func unwindToBookList(_ sender: UIStoryboardSegue) {
        guard let addBookViewController = sender.source as? AddBookViewController else { return }
        guard let book = addBookViewController.book else { return }
        
        tableView.performBatchUpdates({
            books.append(book)
            tableView.insertRows(at: [IndexPath(row: books.count - 1, section: 0)], with: .automatic)
        })
        
        BookService.sharedInstance.saveBooks(books: books, with: storageMethod)
    }
    
    // MARK: - UITableViewDataSource methods
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return books.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BookTableViewCell") as! BookTableViewCell
        
        let book = books[indexPath.row]
        cell.titleLabel.text = book.title
        cell.authorLabel.text = book.author
        
        switch book.category {
        case .fiction:
            cell.categoryLabel.text = "Fiction"
        case .nonfiction:
            cell.categoryLabel.text = "Nonfiction"
        }
        
        return cell
    }
}
