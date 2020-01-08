func greet1(name: String, hometown: String) -> String {
    return "Welcome \(name), of \(hometown)"
}
greet1(name: "Homer Simpson", hometown: "Springfield")


func greet2(name: String, from hometown: String) -> String {
    return "Welcome \(name), of \(hometown)"
}
greet2(name: "Homer Simpson", from: "Springfield")


func greet3(_ name: String, from hometown: String) -> String {
    return "Welcome \(name), of \(hometown)"
}
greet3("Homer Simpson", from: "Springfield")

