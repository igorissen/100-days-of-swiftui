//
//  Activity.swift
//  HabitTracker
//
//  Created by Ismael Gorissen on 19/09/2024.
//

import Foundation

struct Activity: Codable, Equatable, Identifiable {
    var id = UUID()
    var title: String
    var description: String
    var completionCount = 0
    
    static let example = Activity(title: "Example activity", description: "This is a test activity description.")
}
