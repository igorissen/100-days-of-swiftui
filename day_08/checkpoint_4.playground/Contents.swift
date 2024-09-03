import Cocoa

enum SquareRootErrors: Error {
    case outOfBounds, noRoot
}

func findSqrt(_ from: Int) throws -> Int {
    if (from < 1 && from > 10_000) {
        throw SquareRootErrors.outOfBounds
    }
    
    var squareRoot = -1
    
    for i in 1...from {
        if i * i == from {
            squareRoot = i;
            break;
        }
    }
    
    if squareRoot == -1 {
        throw SquareRootErrors.noRoot
    }
    
    return squareRoot
}

let numbers = [9, 25, 4, 100, 36, 23_000]

for number in numbers {
    do {
        let result = try findSqrt(number);
        print("Square root of \(number) is \(result)")
    } catch SquareRootErrors.outOfBounds {
        print("Please provide a number between 1 and 10.000")
    } catch SquareRootErrors.noRoot {
        print("No root found for \(number)")
    } catch {
        print("Unknown error")
    }
}
