//
//  BookService.swift
//  DataPersistanceDemo
//
//  Created by Susan Stevens on 2/25/20.
//  Copyright © 2020 Susan Stevens. All rights reserved.
//

import Foundation

class BookService {
    
    enum StorageMethod {
        case userDefaults, fileManager
    }
    
    static let sharedInstance = BookService()
    
    private init() {}
    
    func fetchBooks(with storageMethod: StorageMethod) -> [Book] {
        switch storageMethod {
        case .userDefaults:
            return fetchBooksFromUserDefaults()
        case .fileManager:
            return fetchBooksFromFile()
        }
    }
    
    func saveBooks(books: [Book], with storageMethod: StorageMethod) {
        switch storageMethod {
        case .userDefaults:
            saveToFile(books: books)
        case .fileManager:
            saveToFile(books: books)
        }
    }
    
    // MARK: - UserDefaults
    
    private func fetchBooksFromUserDefaults() -> [Book] {
        guard let data = UserDefaults.standard.data(forKey: "books") else { return [] }
        
        var books: [Book]?
        do {
            books = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(data) as? [Book]
        } catch (let error) {
            print("Error fetching books from user defaults: \(error)")
        }
        
        return books ?? []
    }
    
    private func saveToUserDefaults(books: [Book]) {
        do {
            let data = try NSKeyedArchiver.archivedData(withRootObject: books,
                                                        requiringSecureCoding: false)
            UserDefaults.standard.set(data, forKey: "books")
        } catch (let error) {
            print("Error saving books to user defaults: \(error)")
        }
    }
    
    // MARK: - FileManager
    
    private func fetchBooksFromFile() -> [Book] {
        guard let documentsDirectory = FileManager.default.urls(for: .documentDirectory,
                                                                in: .userDomainMask).first else { return [] }
        
        let url = documentsDirectory.appendingPathComponent("books.plist")
                
        var books: [Book]?
        do {
            let data = try Data(contentsOf: url)
            books = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(data) as? [Book]
        } catch (let error) {
            print("Error fetching books from file: \(error)")
        }
        return books ?? []
    }
    
    private func saveToFile(books: [Book]) {
        
        guard let documentDirectory = FileManager.default.urls(for: .documentDirectory,
                                                               in: .userDomainMask).first else { return }
        
        print("Path to document directory: \(documentDirectory)")
        let url = documentDirectory.appendingPathComponent("books.plist")
        
        do {
            let data = try NSKeyedArchiver.archivedData(withRootObject: books, requiringSecureCoding: false)
            try data.write(to: url)
        } catch (let error) {
            print("Error saving books to file: \(error)")
        }
    }
}
