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

//struct ContentView: View {
//    @State private var showingConfirmation = false
//    @State private var backgroundColor = Color.white
//    
//    var body: some View {
//        Button("Hello, World!") {
//            showingConfirmation.toggle()
//        }
//        .frame(width: 300, height: 300)
//        .background(backgroundColor)
//        .confirmationDialog("Change background", isPresented: $showingConfirmation) {
//            Button("Red") { backgroundColor = .red }
//            Button("Green") { backgroundColor = .green }
//            Button("Blue") { backgroundColor = .blue }
//            Button("Cancel") { }
//        }
//    }
//}

//import CoreImage
//import CoreImage.CIFilterBuiltins
//
//struct ContentView: View {
//    @State private var image: Image?
//    
//    var body: some View {
//        VStack {
//            image?
//                .resizable()
//                .scaledToFit()
//        }
//        .onAppear(perform: loadImage)
//    }
//    
//    func loadImage() {
//        let inputImage = UIImage(resource: .samQuek0VrtlAF2Zf8Unsplash)
//        let beginImage = CIImage(image: inputImage)
//        
//        let context = CIContext()
//        let currentFilter = CIFilter.sepiaTone()
//        
//        currentFilter.inputImage = beginImage
//        
//        let amount = 1.0
//        let inputKeys = currentFilter.inputKeys
//        
//        if inputKeys.contains(kCIInputIntensityKey) {
//            currentFilter.setValue(amount, forKey: kCIInputIntensityKey)
//        }
//        
//        guard let outputImage = currentFilter.outputImage else { return }
//        guard let cgImg = context.createCGImage(outputImage, from: outputImage.extent) else { return }
//        
//        let uiImage = UIImage(cgImage: cgImg)
//        
//        image = Image(uiImage: uiImage)
//    }
//}

struct ContentView: View {
    var body: some View {
        ContentUnavailableView("No snippets", systemImage: "swift", description: Text("You don't have any saved snippets yet"))
        
        ContentUnavailableView {
            Label("No snippets", systemImage: "swift")
        } description: {
            Text("You don't have any saved snippets yet")
        } actions: {
            Button("Create snippet") {
                // create snippet
            }
            .buttonStyle(.borderedProminent)
        }
    }
}

#Preview {
    ContentView()
}
