// If statements
let score = 8

if score > 10 {
    print("Outstanding")
} else if score > 0 {
    print("Nice work")
} else {
    print("Better luck next time")
}


// Switch statements
let soup = "tomato"

func addTopping(_ topping: String) {
    print("\(soup) and \(topping)")
}

switch soup {
    case "minestrone":
        addTopping("parmesan cheese")
    case "tomato":
        addTopping("goldfish")
    default:
        addTopping("parsely")
}


// For loops
let individualScores = [75, 43, 103, 87, 12]
var teamScore = 0
for score in individualScores {
    if score > 50 {
        teamScore += 3
    } else {
        teamScore += 1
    }
}
print(teamScore)


let ingredients = ["flour", "eggs", "sugar"]
for (index, ingredient) in ingredients.enumerated() {
    print("\(index + 1). \(ingredient)")
}


var total = 0
for i in 0..<4 {
    total += i
}
print(total)


// While loops
var n = 2
while n < 100 {
    n *= 2
}
print(n)
