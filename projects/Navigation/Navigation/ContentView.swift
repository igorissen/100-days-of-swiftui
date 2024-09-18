//
//  ContentView.swift
//  Navigation
//
//  Created by Ismael Gorissen on 18/09/2024.
//

import SwiftUI

//struct DetailView: View {
//    let number: Int
//    
//    var body: some View {
//        Text("Detail View \(number)")
//    }
//    
//    init(number: Int) {
//        self.number = number
//        print("Creating detail view \(number)")
//    }
//}

//struct ContentView: View {
//    var body: some View {
//        NavigationStack {
//            List(0..<1000) { i in
//                NavigationLink("Tap Me") {
//                    DetailView(number: i)
//                }
//            }
//        }
//    }
//}

struct Student: Hashable {
    var id = UUID()
    var name: String
    var age: Int
}

struct ContentView: View {
    var body: some View {
        NavigationStack {
            List(0..<100) { i in
                NavigationLink("Select \(i)", value: i)
            }
            .navigationDestination(for: Int.self) { selection in
                Text("You selected \(selection)")
//                DetailView(number: selection)
            }
//            .navigationDestination(for: Student.self) { student in
//                Text("Student \(student.name) - \(student.id)")
//            }
        }
    }
}

#Preview {
    ContentView()
}
