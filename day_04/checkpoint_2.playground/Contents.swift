import Cocoa

let names = ["Alice", "Grace", "Bob", "Charlie", "David", "Eve", "Frank", "Grace", "Hannah", "Charlie", "Isaac", "Jack"]
print("There is \(names.count) names")

let uniqueNames = Set(names)
print("There is \(uniqueNames.count) unique names")
