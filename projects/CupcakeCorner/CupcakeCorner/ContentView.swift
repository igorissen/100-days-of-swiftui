//
//  ContentView.swift
//  CupcakeCorner
//
//  Created by Ismael Gorissen on 21/09/2024.
//

import SwiftUI

//struct Response: Codable {
//    var results: [Result]
//}
//
//struct Result: Codable {
//    var trackId: Int
//    var trackName: String
//    var collectionName: String
//}
//
//struct ContentView: View {
//    @State private var results = [Result]()
//
//    var body: some View {
//        List(results, id: \.trackId) { item in
//            VStack(alignment: .leading) {
//                Text(item.trackName)
//                    .font(.headline)
//
//                Text(item.collectionName)
//            }
//        }
//        .task {
//            await loadData()
//        }
//    }
//
//    func loadData() async {
//        guard let url = URL(string: "https://itunes.apple.com/search?term=drik+barbosa&entity=song")
//        else {
//            print("Invalid URL")
//            return
//        }
//
//        do {
//            let (data, _) = try await URLSession.shared.data(from: url)
//
//            if let decoded = try? JSONDecoder().decode(Response.self, from: data) {
//                results = decoded.results
//            }
//        } catch {
//            print("Invalid data")
//        }
//    }
//}

//struct ContentView: View {
//    var body: some View {
////        AsyncImage(url: URL(string: "https://hws.dev/img/logo.png"), scale: 3)
//        
////        AsyncImage(url: URL(string: "https://hws.dev/img/logo.png")) { image in
////            image.resizable().scaledToFit()
////        } placeholder: {
////            ProgressView()
////        }
////        .frame(width: 200, height: 200)
//        
//        AsyncImage(url: URL(string: "https://hws.dev/img/logo.png")) { phase in
//            if let image = phase.image {
//                image.resizable().scaledToFit()
//            } else if phase.error != nil {
//                Text("There was an error loading the image")
//            } else {
//                ProgressView()
//            }
//        }
//        .frame(width: 200, height: 200)
//    }
//}

struct ContentView: View {
    @State private var username = ""
    @State private var email = ""
    
    var disabledForm: Bool {
        username.count < 5 || email.count < 5
    }
    
    var body: some View {
        Form {
            Section {
                TextField("Username", text: $username)
                TextField("Email", text: $email)
            }
            
            Section {
                Button("Create account") {
                    print("Creating account...")
                }
            }
            .disabled(disabledForm)
        }
    }
}

#Preview {
    ContentView()
}
