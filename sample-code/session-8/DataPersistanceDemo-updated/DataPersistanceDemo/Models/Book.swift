//
//  Book.swift
//  DataPersistanceDemo
//
//  Created by Susan Stevens on 2/25/20.
//  Copyright © 2020 Susan Stevens. All rights reserved.
//

import Foundation

class Book: NSObject, NSCoding {

    let title: String
    let author: String
    let category: BookCategory

    init?(title: String?, author: String?, category: BookCategory?) {
        guard let title = title, let author = author, let category = category else { return nil }
        guard !title.isEmpty && !author.isEmpty else { return nil }

        self.title = title
        self.author = author
        self.category = category
    }

    required convenience init?(coder aDecoder: NSCoder) {
        let title = aDecoder.decodeObject(forKey: "title") as? String
        let author = aDecoder.decodeObject(forKey: "author") as? String
        let categoryRawValue = aDecoder.decodeInteger(forKey: "category")
        let category = BookCategory(rawValue: categoryRawValue)

        self.init(title: title, author: author, category: category)
    }

    func encode(with aCoder: NSCoder) {
        aCoder.encode(title, forKey: "title")
        aCoder.encode(author, forKey: "author")
        aCoder.encode(category.rawValue, forKey: "category")
    }
}


