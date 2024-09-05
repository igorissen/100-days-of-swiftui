import Cocoa

func getRandomNumber(from numbers: [Int]?) -> Int {
    numbers?.randomElement() ?? Int.random(in: 1...100)
}

print(getRandomNumber(from: nil))
print(getRandomNumber(from: [1, 66, 234, 4200, 3000, 443]))
