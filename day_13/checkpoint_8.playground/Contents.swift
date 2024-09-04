import Cocoa

protocol Building {
    var roomsCount: Int { get set }
    var cost: Int { get set }
    var agentName: String { get set }
    var type: String { get }
    
    func summary()
}
extension Building {
    func summary() {
        print("\(agentName) sold the \(type) which has \(roomsCount) rooms at $\(cost)")
    }
}
struct House: Building {
    var roomsCount: Int
    var cost: Int
    var agentName: String
    let type = "House"
}
struct Office: Building {
    var roomsCount: Int
    var cost: Int
    var agentName: String
    let type = "Office"
}

let taylorHouse = House(roomsCount: 8, cost: 1_200_000, agentName: "Dr. Dre")
taylorHouse.summary()
let appleOffice = Office(roomsCount: 345, cost: 23_123_987, agentName: "Steve Jobs")
appleOffice.summary()
