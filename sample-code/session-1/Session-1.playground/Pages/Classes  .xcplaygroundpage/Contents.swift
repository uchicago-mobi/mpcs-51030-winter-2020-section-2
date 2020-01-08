class Book {
    let title: String
    let author: String
    let pages: Int
    
    var currentPage: Int = 0
    
    var finished: Bool {
        return currentPage == pages
    }
    
    init(title: String, author: String, pages: Int) {
        self.title = title
        self.author = author
        self.pages = pages
    }
    
    func read(numPages: Int) {
        currentPage = min(currentPage + numPages, pages)
    }
    
    func printSummary() {
        print("\(title) by \(author) (\(pages) pages)")
    }
}

let book = Book(title: "Pride and Prejudice",
                author: "Jane Austen",
                pages: 300)

book.read(numPages: 50)
print(book.currentPage)
book.printSummary()



class PictureBook: Book {
    let illustrator: String
    
    init(title: String, author: String, illustrator: String, pages: Int) {
        self.illustrator = illustrator
        super.init(title: title, author: author, pages: pages)
    }
    
    override func printSummary() {
        super.printSummary()
        print("Illustrations by \(illustrator)")
    }
}

let pictureBook = PictureBook(title: "Goodnight Moon", author: "Margaret Wise Brown", illustrator: "Clement Hurd", pages: 10)
pictureBook.printSummary()

