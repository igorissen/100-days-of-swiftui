//
//  ContentView.swift
//  Animations
//
//  Created by Ismael Gorissen on 13/09/2024.
//

import SwiftUI

struct ContentView: View {
//    @State private var animationAmount = 1.0
//    
//    var body: some View {
//        Button("Tap Me") {
//            animationAmount += 1
//        }
//            .padding(50)
//            .background(.red)
//            .foregroundColor(.white)
//            .clipShape(.circle)
//            .overlay(
//                Circle()
//                    .stroke(.red)
//                    .scaleEffect(animationAmount)
//                    .opacity(2 - animationAmount)
//                    .animation(
//                        .easeOut(duration: 1).repeatForever(autoreverses: false),
//                        value: animationAmount
//                    )
//            )
//            .onAppear {
//                animationAmount = 2
//            }
//    }
    
//    @State private var animationAmount = 1.0
//    
//    var body: some View {
//        print(animationAmount)
//        
//        return VStack {
//            Stepper(
//                "Scale amount",
//                value: $animationAmount.animation(
//                    .easeInOut(duration: 1)
//                    .repeatCount(3, autoreverses: true)
//                ),
//                in: 1...10
//            )
//            
//            Spacer()
//            
//            Button("Tap Me") {
//                animationAmount += 1
//            }
//            .padding(40)
//            .background(.red)
//            .foregroundStyle(.white)
//            .clipShape(.circle)
//            .scaleEffect(animationAmount)
//        }
//    }
    
    @State private var animationAmount = 0.0
    
    var body: some View {
        Button("Tap Me") {
            withAnimation(.spring(duration: 1, bounce: 0.5)) {
                animationAmount += 360
            }
        }
        .padding(50)
        .background(.red)
        .foregroundStyle(.white)
        .clipShape(.circle)
        .rotation3DEffect(.degrees(animationAmount), axis: (x: 0.0, y: 1.0, z: 0.0))
    }
}

#Preview {
    ContentView()
}
