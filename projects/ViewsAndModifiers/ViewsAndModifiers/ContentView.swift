//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by Ismael Gorissen on 10/09/2024.
//

import SwiftUI

//struct CapsuleText: View {
//    var text: String
//    
//    var body: some View {
//        Text(text)
//            .font(.largeTitle)
//            .padding()
//            .background(.blue)
//            .clipShape(.capsule)
//    }
//}

//struct Title: ViewModifier {
//    func body(content: Content) -> some View {
//        content.font(.largeTitle)
//            .foregroundStyle(.white)
//            .padding()
//            .background(.blue)
//            .clipShape(.rect(cornerRadius: 10))
//    }
//}
//
//extension View {
//    func titleStyle() -> some View {
//        modifier(Title())
//    }
//}
//
//struct Watermark: ViewModifier {
//    var text: String
//    
//    func body(content: Content) -> some View {
//        ZStack(alignment: .bottomTrailing) {
//            content
//            
//            Text(text)
//                .font(.caption)
//                .foregroundStyle(.white)
//                .padding(5)
//                .background(.black)
//        }
//    }
//}
//
//extension View {
//    func watermark(with text: String) -> some View {
//        modifier(Watermark(text: text))
//    }
//}

struct GridStack<Content: View>: View {
    let rows: Int
    let columns: Int
    @ViewBuilder let content: (Int, Int) -> Content
    
    var body: some View {
        VStack {
            ForEach(0..<rows, id: \.self) { row in
                HStack {
                    ForEach(0..<columns, id: \.self) { column in
                        content(row, column)
                    }
                }
            }
        }
    }
}

struct ContentView: View {
//    @State private var useRedText = false
    
//    var motto1: some View {
//        Text("Draco dormiens")
//    }
//    
//    let motto2 = Text("Nunquam Titillandus")
//    
//    @ViewBuilder var spells: some View {
//        VStack {
//            Text("Lumos")
//            Text("Obliviate")
//        }
//    }
    
    var body: some View {
//        VStack {
//            Image(systemName: "globe")
//                .imageScale(.large)
//                .foregroundStyle(.tint)
//            Text("Hello, world!")
//        }
//        .frame(maxWidth: .infinity, maxHeight: .infinity)
//        .background(.red)
        
//        Button("Hello, World!") {
//            print(type(of: self.body))
//        }
//        .frame(width: 200, height: 200)
//        .background(.red)
        
//        Text("Hello, World!")
//            .padding()
//            .background(.red)
//            .padding()
//            .background(.yellow)
//            .padding()
//            .background(.blue)
//            .padding()
//            .background(.indigo)
//            .padding()
//            .background(.black)
        
//        Button("Toggle Text Color") {
//            useRedText.toggle()
//        }
//        .foregroundColor(useRedText ? .red : .blue)
        
//        VStack {
//            Text("Gryffindor")
//                .font(.largeTitle)
//            Text("Hufflepuff")
//            Text("Ravenclaw")
//            Text("Slytherin")
//        }
//        .font(.title)
        
//        VStack {
//            motto1.foregroundStyle(.red)
//            motto2.foregroundStyle(.blue)
//        }
        
//        VStack(spacing: 10) {
//            CapsuleText(text: "First")
//                .foregroundStyle(.white)
//            CapsuleText(text: "Second")
//                .foregroundStyle(.yellow)
//        }
        
//        Text("Hello, World!")
//            .modifier(Title())
//        Text("Hello, World!")
//            .titleStyle()
//        
//        Color.blue
//            .frame(width: 300, height: 200)
//            .watermark(with: "Hacking with Swift")
        
        GridStack(rows: 4, columns: 4) { row, column in
                Image(systemName: "\(row * 4 + column).circle")
                Text("R\(row)C\(column)")
        }
    }
}

#Preview {
    ContentView()
}
