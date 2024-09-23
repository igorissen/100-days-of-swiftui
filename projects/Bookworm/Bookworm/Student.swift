//
//  Student.swift
//  Bookworm
//
//  Created by Ismael Gorissen on 25/09/2024.
//

import Foundation
import SwiftData

@Model
class Student {
    var id: UUID
    var name: String
    
    init(id: UUID, name: String) {
        self.id = id
        self.name = name
    }
}
