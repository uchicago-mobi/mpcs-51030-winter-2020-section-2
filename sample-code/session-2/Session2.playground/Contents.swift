import Foundation

let cities = ["Albuquerque", "Chicago", "Boston"]

// Notice that this function's type is (String, String) -> Bool.
func reverseAlphabetical(_ s1: String, _ s2: String) -> Bool {
    return s1 > s2 // returns true if s1 comes after s2 in the alphabet
}

// The sorted(by:) method takes one parameter, a function
// of type (String, String) -> Bool.
let reversedCities1 = cities.sorted(by: reverseAlphabetical)


// Basic closure syntax.
let reversedCities2 = cities.sorted(by: { (s1: String, s2: String) -> Bool in
    return s1 > s2
})

// Trailing closure syntax.
let reversedCities3 = cities.sorted { (s1: String, s2: String) -> Bool in
    return s1 > s2
}

// Inferring type from context.
let reversedCities4 = cities.sorted { s1, s2 in return s1 > s2 }

// Implicit return from a single-expression closure.
let reversedCities5 = cities.sorted { s1, s2 in s1 > s2 }

// Shorthand argument names.
let reversedCities6 = cities.sorted { $0 > $1 }

// Operator method.
let reversedCities7 = cities.sorted(by: >)

print(reversedCities1)
print(reversedCities2)
print(reversedCities3)
print(reversedCities4)
print(reversedCities5)
print(reversedCities6)
print(reversedCities7)
