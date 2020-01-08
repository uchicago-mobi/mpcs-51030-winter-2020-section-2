struct Address {
    let street: String
    let city: String
    let state: String
    let zip: String
    
    func formattedAddress() -> String {
        return """
                \(street)
                \(city), \(state)
                \(zip)
                """
    }
}

// Memberwise initializer
let address = Address(street: "5730 S Ellis Ave",
                      city: "Chicago",
                      state: "IL",
                      zip: "60637")

print(address.formattedAddress())



// Structs are pass by value, while classes are pass by reference
struct Point {
    var x: Int
    var y: Int
}

var point1 = Point(x: 0, y: 0)
var point2 = point1

point2.x = 50
point2.y = 50

print("(\(point1.x), \(point1.y))")

struct Shape {
    var center: Point
}

let initialPoint = Point(x: 5, y: 5)
var circle = Shape(center: initialPoint)
var square = Shape(center: initialPoint)

square.center.x = 2



