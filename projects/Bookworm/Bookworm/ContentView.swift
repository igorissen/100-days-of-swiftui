//
//  ContentView.swift
//  Bookworm
//
//  Created by Ismael Gorissen on 23/09/2024.
//

import SwiftData
import SwiftUI

//struct PushButton: View {
//    let title: String
//
//    @Binding var isOn: Bool
//
//    var onColors = [Color.red, Color.yellow]
//    var offColors = [Color(white: 0.6), Color(white: 0.4)]
//
//    var body: some View {
//        Button(title) {
//            isOn.toggle()
//        }
//        .padding()
//        .background(
//            LinearGradient(colors: isOn ? onColors : offColors, startPoint: .top, endPoint: .bottom)
//        )
//        .foregroundStyle(.white)
//        .clipShape(.capsule)
//        .shadow(radius: isOn ? 0 : 5)
//    }
//}
//
//struct ContentView: View {
//    @State private var rememberMe = false
//
//    var body: some View {
//        VStack {
//            PushButton(title: "Remember Me", isOn: $rememberMe)
//            Text(rememberMe ? "On" : "Off")
//        }
//    }
//}

//struct ContentView: View {
//    @AppStorage("notes") private var notes = ""
//    
//    var body: some View {
//        NavigationStack {
////            TextEditor(text: $notes)
////                .navigationTitle("Notes")
////                .padding()
//            
////            TextField("Enter your text", text: $notes, axis: .vertical)
////                .textFieldStyle(.roundedBorder)
////                .navigationTitle("Notes")
////                .padding()
//            
//            Form {
//                Section {
//                    TextEditor(text: $notes)
//                }
//                
//                Section {
//                    TextField("Enter your text", text: $notes, axis: .vertical)
//                }
//            }
//            .navigationTitle("Notes")
//        }
//    }
//}

struct ContentView: View {
    @Environment(\.modelContext) var modelContext
    
    @Query var students: [Student]
    
    var body: some View {
        NavigationStack {
            List(students) { student in
                Text(student.name)
            }
            .navigationTitle("Classroom")
            .toolbar {
                Button("Add") {
                    let firstNames = ["Ginny", "Harry", "Hermione", "Luna", "Ron"]
                    let lastNames = ["Granger", "Lovegood", "Potter", "Weasley"]
                    let chosenFirstName = firstNames.randomElement()!
                    let chosenLastName = lastNames.randomElement()!
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
