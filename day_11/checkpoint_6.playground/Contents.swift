import Cocoa

struct Car {
    let model: String
    let seatsCount: Int
    private(set) var currentGear: Int = 0
    
    init(model: String, seatsCount: Int) {
        self.model = model
        self.seatsCount = seatsCount
    }
    
    mutating func gearUp() {
        if currentGear == 6 {
            return
        }
        
        currentGear += 1
    }
    
    mutating func gearDown() {
        if currentGear == 0 {
            return
        }
        
        currentGear -= 1
    }
}

var lexus = Car(model: "UX 250h", seatsCount: 5)

lexus.gearUp();
lexus.gearUp();
lexus.gearUp();
lexus.gearDown();
lexus.gearUp();
lexus.gearUp();
print("Current gear : \(lexus.currentGear)")
