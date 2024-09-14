//
//  ContentView.swift
//  MultiplicationQuest
//
//  Created by Ismael Gorissen on 14/09/2024.
//

import SwiftUI

struct Question {
    var id: Int
    var answer: Int?
    var label: String
    var choices: [Int]
    var correctAnswer: Int
    
    var isValid: Bool {
        correctAnswer == answer
    }
    
    init(id: Int, label: String, correctAnswer: Int, choices: [Int]) {
        self.id = id
        self.label = label
        self.correctAnswer = correctAnswer
        self.choices = choices
    }
}

struct ContentView: View {
    @State private var isGameSettings = true
    @State private var isGame = false
    @State private var selectedDifficulty = 10
    @State private var selectedMultiplicationTables: [Int] = []
    @State private var isShowingErrorAlert = false
    @State private var errorTitle = ""
    @State private var errorMessage = ""
    @State private var isGameScore = false
    
    let difficulties = [5, 10, 20]
    
    @State private var questions: [Question] = []
    @State private var currentQuestion = 0
    
    var body: some View {
        if isGameSettings {
            Form {
                Section("Tables") {
                    ForEach(2..<13, id: \.self) { number in
                        Button("\(number)") {
                            selectTable(table: number)
                        }
                        .foregroundStyle(selectedMultiplicationTables.contains(number) ? .green : .black)
                    }
                }
                
                Section("Difficulty") {
                    Picker("Choose the number of questions", selection: $selectedDifficulty) {
                        ForEach(difficulties, id: \.self) {
                            Text("\($0)")
                        }
                    }
                    .pickerStyle(.segmented)
                }
            }
            .alert(errorTitle, isPresented: $isShowingErrorAlert) {
                Button("OK") {}
            } message: {
                Text(errorMessage)
            }
            
            Button("Start") {
                guard !selectedMultiplicationTables.isEmpty else {
                    errorTitle = "Missing Input"
                    errorMessage = "You have not selected any multiplication table! Please select one or more multiplication tables."
                    isShowingErrorAlert.toggle()
                    return
                }
                
                isGameSettings.toggle()
                prepareQuestions()
                isGame.toggle()
            }
        }
        
        if isGame {
            Section {
                Text("Question \(currentQuestion + 1) of \(selectedDifficulty)")
            }
            
            Section {
                Text("What is...").font(.title)
                Text(questions[currentQuestion].label)
            }
            
            Section {
                ForEach(questions[currentQuestion].choices, id: \.self) { choice in
                    Button("\(choice)") {
                        selectChoice(choice)
                    }
                }
            }
        }
        
        if isGameScore {
            ForEach(questions, id: \.self.id) { question in
                HStack(spacing: 5) {
                    Text("\(question.label) = \(question.answer!)")
                        .foregroundStyle(question.isValid ? .green : .red)
                    
                    if !question.isValid {
                        Text("(\(question.correctAnswer))")
                            .foregroundStyle(.orange)
                    }
                }
            }
            
            Button("Start a new game") {
                isGameScore.toggle()
                questions = []
                selectedMultiplicationTables = []
                selectedDifficulty = 10
                currentQuestion = 0
                isGameSettings.toggle()
            }
        }
    }
    
    func selectTable(table: Int) {
        guard !selectedMultiplicationTables.contains(table) else {
            let index = selectedMultiplicationTables.firstIndex(of: table)
            if index != nil {
                selectedMultiplicationTables.remove(at: index!)
            }
            return
        }
        selectedMultiplicationTables.append(table)
    }
    
    func prepareQuestions() {
        selectedMultiplicationTables.shuffle()
        
        for i in 1...selectedDifficulty {
            let table = selectedMultiplicationTables[Int.random(in: 0..<selectedMultiplicationTables.count)]
            let randomOperand = Int.random(in: 1...10)
            let label = "\(table) x \(randomOperand)"
            let correctAnswer = table * randomOperand
            var choices = [correctAnswer]
            
            
            while choices.count != 4 {
                let number = Int.random(in: 0...(correctAnswer * 2))
                if !choices.contains(number) {
                    choices.append(number)
                }
            }
            choices.shuffle()
            
            questions.append(Question(id: i, label: label, correctAnswer: correctAnswer, choices: choices))
        }
    }
    
    func selectChoice(_ choice: Int) {
        questions[currentQuestion].answer = choice
        
        print("Current question index: \(currentQuestion) / selected difficulty: \(selectedDifficulty - 1)")
        
        guard currentQuestion == selectedDifficulty - 1 else {
            currentQuestion += 1
            return
        }
        
        isGame.toggle()
        isGameScore.toggle()
    }
}

#Preview {
    ContentView()
}
