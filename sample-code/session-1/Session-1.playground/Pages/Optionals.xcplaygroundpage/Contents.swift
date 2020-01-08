import UIKit

class User {
    var username: String
    var photo: UIImage?
    
    init(username: String, photo: UIImage?) {
        self.username = username
        self.photo = photo
    }
}

let logo = UIImage(imageLiteralResourceName: "swift")
let user = User(username: "ios-dev", photo: logo)


// Optional chaining
let bytes1 = user.photo?.pngData()?.count


// Forced unwrapping
let bytes2 = user.photo!.pngData()!.count


// Nil coalescing
let bytes3 = user.photo?.pngData()?.count ?? 0


// Optional binding with "if let"
func printSize1(_ user: User) {
    if let data = user.photo?.pngData() {
        print("Bytes: \(data.count)")
    }
}

printSize1(user)


// Optional binding with "guard let"
func printSize2(_ user: User) {
    guard let data = user.photo?.pngData() else {
        print("No data")
        return
    }
    
    print("Bytes: \(data.count)")
}

printSize2(user)





