import Cocoa

class Animal {
    var legs: Int
    
    init(legs: Int) {
        self.legs = legs
    }
    
    func speak() {
        print("...")
    }
}
class Dog: Animal {
    override func speak() {
        print("Woof")
    }
}
final class Corgi: Dog {}
final class Poodle: Dog {}
class Cat: Animal {
    let isTame: Bool
    
    init(legs: Int, isTame: Bool) {
        self.isTame = isTame
        super.init(legs: legs)
    }
    
    override func speak() {
        print("Miaou")
    }
}
class Persian: Cat {}
class Lion: Cat {}

let corgi = Corgi(legs: 4)
print("Corgi have \(corgi.legs) legs")
print(corgi.speak())

let poodle = Poodle(legs: 4)
print("Poodle have \(poodle.legs) legs")
print(poodle.speak())

let persian = Persian(legs: 4, isTame: true)
print("Persian have \(persian.legs) legs and tamed: \(persian.isTame)")
print(persian.speak())

let lion = Lion(legs: 4, isTame: false)
print("Lion have \(lion.legs) legs and tamed: \(lion.isTame)")
print(lion.speak())
