//
//  ContentView.swift
//  iExpense
//
//  Created by Ismael Gorissen on 15/09/2024.
//

import SwiftUI

//@Observable
//class User {
//    var firstName = "Bilbo"
//    var lastName = "Baggins"
//}
//
//struct ContentView: View {
//    @State private var user = User()
//    
//    var body: some View {
//        VStack {
//            Text("Your name is \(user.firstName) \(user.lastName)")
//            
//            TextField("First name", text: $user.firstName)
//            TextField("Last name", text: $user.lastName)
//        }
//        .padding()
//    }
//}

//struct SecondView: View {
//    @Environment(\.dismiss) var dismiss
//    
//    let name: String
//    
//    var body: some View {
//        Text("Hello, \(name)")
//        
//        Button("Dismiss") {
//            dismiss()
//        }
//    }
//}
//
//struct ContentView: View {
//    @State private var showingSheet = false
//    
//    var body: some View {
//        Button("Show sheet") {
//            showingSheet.toggle()
//        }
//        .sheet(isPresented: $showingSheet) {
//            SecondView(name: "@fluxb0x")
//        }
//    }
//}

//struct ContentView: View {
//    @State private var numbers = [Int]()
//    @State private var currentNumber = 1
//    
//    var body: some View {
//        NavigationStack {
//            VStack {
//                List {
//                    ForEach(numbers, id: \.self) {
//                        Text("Row \($0)")
//                    }
//                    .onDelete(perform: removeRows)
//                }
//                
//                Button("Add Number") {
//                    numbers.append(currentNumber)
//                    currentNumber += 1
//                }
//            }
//            .toolbar {
//                EditButton()
//            }
//        }
//    }
//    
//    func removeRows(at offsets: IndexSet) {
//        numbers.remove(atOffsets: offsets)
//    }
//}

//struct ContentView: View {
////    @State private var tapCount = UserDefaults.standard.integer(forKey: "Tap")
////    
////    var body: some View {
////        Button("Tap Count: \(tapCount)") {
////            tapCount += 1
////            UserDefaults.standard.set(tapCount, forKey: "Tap")
////        }
////    }
//    
//    @AppStorage("tapCount") private var tapCount = 0
//    
//    var body: some View {
//        Button("Tap Count: \(tapCount)") {
//            tapCount += 1
//        }
//    }
//}

//struct User: Codable {
//    let firstName: String
//    let lastName: String
//}
//
//struct ContentView: View {
//    @State private var user = User(firstName: "Taylor", lastName: "Swift")
//    var body: some View {
//        Button("Save user") {
//            let encoder = JSONEncoder()
//            
//            if let data = try? encoder.encode(user) {
//                UserDefaults.standard.set(data, forKey: "UserData")
//            }
//        }
//    }
//}

struct ExpenseItem: Identifiable, Codable, Equatable {
    var id = UUID()
    let name: String
    let type: String
    let amount: Double
}

@Observable
class Expenses {
    var items = [ExpenseItem]() {
        didSet {
            if let encoded = try? JSONEncoder().encode(items) {
                UserDefaults.standard.set(encoded, forKey: "Items")
            }
        }
    }
    
    var personalItems: [ExpenseItem] {
        items.filter { $0.type == "Personal" }
    }
    var businessItems: [ExpenseItem] {
        items.filter { $0.type == "Business" }
    }
    
    init() {
        if let savedItems = UserDefaults.standard.data(forKey: "Items") {
            if let decodedItems = try? JSONDecoder().decode([ExpenseItem].self, from: savedItems) {
                items = decodedItems
                return
            }
        }
        
        items = []
    }
}

struct ContentView: View {
    @State private var expenses = Expenses()
//    @State private var showingAddExpenseView = false
    
    var body: some View {
        NavigationStack{
            List {
                if expenses.items.count > 0 {
                    ExpenseSectionView(title: "Business", expenses: expenses.businessItems, deleteItems: removeBusinessItems)
                    
                    ExpenseSectionView(title: "Personal", expenses: expenses.personalItems, deleteItems: removePersonalItems)
                }
            }
            .navigationTitle("iExpense")
            .toolbar {
                NavigationLink {
                    AddView(expenses: expenses)
                } label: {
                    Label("Add Expense", systemImage: "plus")
                }
//                Button("Add Expense", systemImage: "plus") {
//                    showingAddExpenseView = true
//                }
            }
//            .sheet(isPresented: $showingAddExpenseView) {
//                AddView(expenses: expenses)
//            }
        }
    }
    
    func removeItems(at offsets: IndexSet, in inputArray: [ExpenseItem]) {
        var itemsToDelete = IndexSet()
        
        for offset in offsets {
            let item = inputArray[offset]
            
            if let index = expenses.items.firstIndex(of: item) {
                itemsToDelete.insert(index)
            }
        }
        
        expenses.items.remove(atOffsets: itemsToDelete)
    }
    
    func removeBusinessItems(at offsets: IndexSet) {
        removeItems(at: offsets, in: expenses.businessItems)
    }
    
    func removePersonalItems(at offsets: IndexSet) {
        removeItems(at: offsets, in: expenses.personalItems)
    }
}

#Preview {
    ContentView()
}
