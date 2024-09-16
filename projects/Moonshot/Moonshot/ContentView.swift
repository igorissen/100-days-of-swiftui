//
//  ContentView.swift
//  Moonshot
//
//  Created by Ismael Gorissen on 16/09/2024.
//

import SwiftUI

struct CustomText: View {
    let text: String
    
    var body: some View {
        Text(text)
    }
    
    init(text: String) {
        print("Creating a new CustomText view: \(text)")
        self.text = text
    }
}

struct User: Codable {
    let name: String
    let address: Address
}

struct Address: Codable {
    let street: String
    let city: String
}

struct ContentView: View {
    let layout = [
        GridItem(.adaptive(minimum: 80))
    ]
    
    var body: some View {
//        Image(.spenserSembratCZYgsMGOIUUnsplash)
//            .resizable()
//            .scaledToFit()
//            .frame(width: 300, height: 300)
        
//        Image(.spenserSembratCZYgsMGOIUUnsplash)
//            .resizable()
//            .scaledToFill()
//            .frame(width: 300, height: 300)
        
//        Image(.spenserSembratCZYgsMGOIUUnsplash)
//            .resizable()
//            .scaledToFit()
//            .containerRelativeFrame(.horizontal) { size, axis in
//                size * 0.8
//            }
        
//        ScrollView {
//            VStack(spacing: 10) {
//                ForEach(0..<100) {
//                    CustomText(text: "Item \($0)")
//                        .font(.title)
//                }
//            }
//            .frame(maxWidth: .infinity)
//        }
        
//        ScrollView {
//            LazyVStack(spacing: 10) {
//                ForEach(0..<100) {
//                    CustomText(text: "Item \($0)")
//                        .font(.title)
//                }
//            }
//            .frame(maxWidth: .infinity)
//        }
        
//        ScrollView(.horizontal) {
//            LazyHStack(spacing: 10) {
//                ForEach(0..<100) {
//                    CustomText(text: "Item \($0)")
//                        .font(.title)
//                }
//            }
//        }
        
//        NavigationStack {
//            NavigationLink {
//                Text("Detail View")
//            } label: {
//                VStack {
//                    Text("This is the label")
//                    Text("So is this")
//                    Image(systemName: "face.smiling")
//                }
//                .font(.largeTitle)
//            }
//            .navigationTitle("SwiftUI")
//        }
        
//        NavigationStack {
//            List(0..<100) { row in
//                NavigationLink("Row \(row)") {
//                    Text("Detail Row \(row)")
//                }
//            }
//            .navigationTitle("SwiftUI")
//        }
        
//        Button("Decode JSON") {
//            let input = """
//            {
//                "name": "Taylor Swift",
//                "address": {
//                    "street": "555, Taylor Swift Avenue",
//                    "city": "Nashville"
//                }
//            }
//            """
//            
//            let data = Data(input.utf8)
//            
//            
//            if let user = try? JSONDecoder().decode(User.self, from: data) {
//                print(user)
//            }
//        }
        
//        ScrollView {
//            LazyVGrid(columns: layout) {
//                ForEach(0..<1000) {
//                    Text("Item \($0)")
//                }
//            }
//        }
        
//        ScrollView(.horizontal) {
//            LazyHGrid(rows: layout) {
//                ForEach(0..<1000) {
//                    Text("Item \($0)")
//                }
//            }
//        }
        
        VStack { }
    }
}

#Preview {
    ContentView()
}
