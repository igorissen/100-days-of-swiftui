//
//  ContentView.swift
//  CupcakeCorner
//
//  Created by Ismael Gorissen on 21/09/2024.
//

import CoreHaptics
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

//struct ContentView: View {
//    @State private var username = ""
//    @State private var email = ""
//    
//    var disabledForm: Bool {
//        username.count < 5 || email.count < 5
//    }
//    
//    var body: some View {
//        Form {
//            Section {
//                TextField("Username", text: $username)
//                TextField("Email", text: $email)
//            }
//            
//            Section {
//                Button("Create account") {
//                    print("Creating account...")
//                }
//            }
//            .disabled(disabledForm)
//        }
//    }
//}

//@Observable
//class User: Codable {
//    enum CodingKeys: String, CodingKey {
//        case _name = "name"
//    }
//    
//    var name = "Taylor"
//}
//
//struct ContentView: View {
//    var body: some View {
//        Button("Encode Taylor", action: encodeTaylor)
//    }
//    
//    func encodeTaylor() {
//        let data = try! JSONEncoder().encode(User())
//        let str = String(decoding: data, as: UTF8.self)
//        print(str)
//    }
//}

//struct ContentView: View {
////    @State private var counter = 0
//    @State private var hapticEngine: CHHapticEngine?
//    
//    var body: some View {
////        Button("Tap Count: \(counter)") {
////            counter += 1
////        }
////        .sensoryFeedback(.increase, trigger: counter)
////        .sensoryFeedback(.impact(flexibility: .soft, intensity: 0.5), trigger: counter)
////        .sensoryFeedback(.impact(weight: .heavy, intensity: 1), trigger: counter)
//        
//        Button("Play Haptic", action: complexSuccess)
//            .onAppear(perform: prepareHaptics)
//    }
//    
//    func prepareHaptics() {
//        guard CHHapticEngine.capabilitiesForHardware().supportsHaptics else { return }
//        
//        do {
//            hapticEngine = try CHHapticEngine()
//            try hapticEngine?.start()
//        } catch {
//            print("There was an error creating the engine: \(error.localizedDescription)")
//        }
//    }
//    
//    func complexSuccess() {
//        guard CHHapticEngine.capabilitiesForHardware().supportsHaptics else { return }
//        
//        var events = [CHHapticEvent]()
//        
//        for i in stride(from: 0, to: 1, by: 0.1) {
//            let intensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(i))
//            let sharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(i))
//            let event = CHHapticEvent(eventType: .hapticTransient, parameters: [intensity, sharpness], relativeTime: i)
//            
//            events.append(event)
//        }
//        
//        for i in stride(from: 0, to: 1, by: 0.1) {
//            let intensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(1 - i))
//            let sharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(1 - i))
//            let event = CHHapticEvent(eventType: .hapticTransient, parameters: [intensity, sharpness], relativeTime: 1 + i)
//            
//            events.append(event)
//        }
//        
//        do {
//            let pattern = try CHHapticPattern(events: events, parameters: [])
//            let player = try hapticEngine?.makePlayer(with: pattern)
//            try player?.start(atTime: 0)
//        } catch {
//            print("Failed to play pattern: \(error.localizedDescription)")
//        }
//    }
//}

struct ContentView: View {
    @State private var order = Order()
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    Picker("Select your cake type", selection: $order.type) {
                        ForEach(Order.types.indices, id: \.self) {
                            Text(Order.types[$0])
                        }
                    }
                    
                    Stepper("Number of cakes: \(order.quantity)", value: $order.quantity, in: 3...20)
                }
                
                Section {
                    Toggle("Any special request?", isOn: $order.specialRequestEnabled.animation())
                    
                    if order.specialRequestEnabled {
                        Toggle("Add extra frosting", isOn: $order.extraFrosting)
                        
                        Toggle("Add extra sprinkles", isOn: $order.addSprinkles)
                    }
                }
                
                Section {
                    NavigationLink("Delivery details") {
                        AddressView(order: order)
                    }
                }
            }
            .navigationTitle("Cupcake Corner")
        }
    }
}

#Preview {
    ContentView()
}
