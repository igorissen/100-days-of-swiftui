//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Ismael Gorissen on 10/09/2024.
//

import SwiftUI

struct ContentView: View {
    @State private var shouldWin = Bool.random()
    @State private var currentRound = 0
    @State private var cpuCurrentChoice = Int.random(in: 0..<3)
    @State private var score = 0
    @State private var isGameEnded = false
    @State private var moves = ["👊", "🖐️", "✌️"]
    
    let winningMoves = [1, 2, 0]
    
    var body: some View {
        VStack {
            Spacer()
            
            Text("Score").font(.headline)
            Text("\(score)").font(.largeTitle)
            
            Spacer()
            
            Text("Computer has played...").font(.headline)
            Text(moves[cpuCurrentChoice]).font(.system(size: 200))
            
            Spacer()
            
            shouldWin ? Text("Which one wins?").font(.title).foregroundStyle(.green) : Text("Which one loses?").font(.title).foregroundStyle(.red)
            
            
            HStack {
                ForEach(0..<3) { number in
                    Button(moves[number]) {
                        moveSelected(move: number)
                    }
                    .font(.system(size: 80))
                }
            }
            
            Spacer()
        }
        .alert("Game ended", isPresented: $isGameEnded) {
            Button("New Game", action: newGame)
        } message: {
            Text("Your score was \(score)")
        }
    }
    
    func moveSelected(move: Int) {
        let didWin: Bool
        
        currentRound += 1
        
        if currentRound == 10 {
            isGameEnded.toggle()
        } else {
            if shouldWin {
                didWin = move == winningMoves[cpuCurrentChoice]
            } else {
                didWin = winningMoves[move] == cpuCurrentChoice
            }
            
            if didWin {
                score += 1
            } else {
                score -= 1
            }
            
            shouldWin = Bool.random()
            cpuCurrentChoice = Int.random(in: 0..<3)
        }
    }
    
    func newGame() {
        currentRound = 0
        score = 0
        shouldWin = Bool.random()
        cpuCurrentChoice = Int.random(in: 0..<3)
        isGameEnded = false
    }
}

#Preview {
    ContentView()
}
