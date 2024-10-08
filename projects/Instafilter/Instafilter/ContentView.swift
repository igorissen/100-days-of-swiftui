//
//  ContentView.swift
//  Instafilter
//
//  Created by Ismael Gorissen on 07/10/2024.
//

import SwiftUI

//struct ContentView: View {
//    @State private var blurAmount = 0.0
//    
//    var body: some View {
//        VStack {
//            Text("Hello, world!")
//                .blur(radius: blurAmount)
//            
//            Slider(value: $blurAmount, in: 0...20)
//                .onChange(of: blurAmount) { oldValue, newValue in
//                    print("New value is \(newValue)")
//                }
//            
//            Button("Random Blur") {
//                blurAmount = Double.random(in: 0...20)
//            }
//        }
//        .padding()
//    }
//}

struct ContentView: View {
    @State private var showingConfirmation = false
    @State private var backgroundColor = Color.white
    
    var body: some View {
        Button("Hello, World!") {
            showingConfirmation.toggle()
        }
        .frame(width: 300, height: 300)
        .background(backgroundColor)
        .confirmationDialog("Change background", isPresented: $showingConfirmation) {
            Button("Red") { backgroundColor = .red }
            Button("Green") { backgroundColor = .green }
            Button("Blue") { backgroundColor = .blue }
            Button("Cancel") { }
        }
    }
}

#Preview {
    ContentView()
}
