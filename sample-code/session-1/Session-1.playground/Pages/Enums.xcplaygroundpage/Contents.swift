enum Direction {
    
    case north, south, east, west
    
    var witch: String {
        switch self {
        case .north:
            return "Good Witch of the North"
        case .south:
            return "Glinda the Good Witch"
        case .east:
            return "Wicked Witch of the East"
        case .west:
            return "Wicked Witch of the West"
        }
    }
}

func printWarning(for direction: Direction) {
    print("You may encounter: \(direction.witch)")
}

printWarning(for: Direction.west)
