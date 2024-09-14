//
//  ContentView.swift
//  Animations
//
//  Created by Ismael Gorissen on 13/09/2024.
//

import SwiftUI

struct CornerRotateModifier: ViewModifier {
    let amount: Double
    let anchor: UnitPoint
    
    func body(content: Content) -> some View {
        content
            .rotationEffect(.degrees(amount), anchor: anchor)
            .clipped()
    }
}

extension AnyTransition {
    static var pivot: AnyTransition {
        .modifier(active: CornerRotateModifier(amount: -90, anchor: .topLeading), identity: CornerRotateModifier(amount: 0, anchor: .topLeading))
    }
}

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
    
//    @State private var animationAmount = 0.0
//    
//    var body: some View {
//        Button("Tap Me") {
//            withAnimation(.spring(duration: 1, bounce: 0.5 )) {
//                animationAmount += 360
//            }
//        }
//        .padding(50)
//        .background(.red)
//        .foregroundStyle(.white)
//        .clipShape(.circle)
//        .rotation3DEffect(.degrees(animationAmount), axis: (x: 0.0, y: 1.0, z: 0.0))
//    }
    
//    @State private var enabled = false
//    
//    var body: some View {
//        Button("Tap Me") {
//            enabled.toggle()
//        }
//        .frame(width: 200, height: 200)
//        .background(enabled ? .blue : .red)
//        .foregroundStyle(.white)
//        .animation(.default, value: enabled)
//        .clipShape(.rect(cornerRadius: enabled ? 60 : 0))
//        .animation(.spring(duration: 1.4, bounce: 0.6), value: enabled)
//    }
    
//    @State private var dragAmount = CGSize.zero
//    
//    var body: some View {
//        LinearGradient(colors: [.yellow, .red], startPoint: .topLeading, endPoint: .bottomTrailing)
//            .frame(width: 300, height: 200)
//            .clipShape(.rect(cornerRadius: 10))
//            .offset(dragAmount)
//            .gesture(
//                DragGesture()
//                    .onChanged { dragAmount = $0.translation }
//                    .onEnded { _ in
//                        withAnimation(.bouncy) {
//                            dragAmount = .zero
//                        }
//                    }
//            )
////            .animation(.bouncy, value: dragAmount)
//    }
    
//    let letters = Array("Hello SwiftUI")
//    
//    @State private var enabled = false
//    @State private var dragAmount = CGSize.zero
//    
//    var body: some View {
//        HStack(spacing: 0) {
//            ForEach(0..<letters.count, id: \.self) { num in
//                Text(String(letters[num]))
//                    .padding(5)
//                    .font(.title)
//                    .background(enabled ? .blue : .red)
//                    .offset(dragAmount)
//                    .animation(.linear.delay(Double(num) / 20), value: dragAmount)
//            }
//        }
//        .gesture(
//            DragGesture()
//                .onChanged {
//                    dragAmount = $0.translation
//                }
//                .onEnded { _ in
//                    dragAmount = .zero
//                    enabled.toggle()
//                }
//        )
//    }
    
//    @State private var isShowingRed = false
//    
//    var body: some View {
//        Button("Tap Me") {
//            withAnimation {
//                isShowingRed.toggle()
//            }
//        }
//        
//        if isShowingRed {
//            Rectangle()
//                .fill(.red)
//                .frame(width: 200, height: 200)
////                .transition(.scale)
//                .transition(.asymmetric(insertion: .scale, removal: .opacity))
//        }
//    }
    @State private var isShowingRed = false
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(.blue)
                .frame(width: 200, height: 200)
            
            if isShowingRed {
                Rectangle()
                    .fill(.red)
                    .frame(width: 200, height: 200)
                    .transition(.pivot)
            }
        }
        .onTapGesture {
            withAnimation {
                isShowingRed.toggle()
            }
        }
    }
}

#Preview {
    ContentView()
}
