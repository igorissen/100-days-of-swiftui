//
//  FriendfaceApp.swift
//  Friendface
//
//  Created by Ismael Gorissen on 02/10/2024.
//

import SwiftData
import SwiftUI

@main
struct FriendfaceApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: User.self)
    }
}
