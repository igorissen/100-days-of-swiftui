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

struct ExpenseItem: Identifiable, Codable {
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
    @State private var showingAddExpenseView = false
    
    var body: some View {
        NavigationStack{
            List {
                ForEach(expenses.items) { item in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(item.name)
                                .font(.headline)
                            
                            Text(item.type)
                                .font(.subheadline)
                        }
                        
                        Spacer()
                        
                        Text(item.amount, format: .currency(code: "USD"))
                    }
                }
                .onDelete(perform: removeItems)
            }
            .navigationTitle("iExpense")
            .toolbar {
                Button("Add Expense", systemImage: "plus") {
                    showingAddExpenseView = true
                }
            }
            .sheet(isPresented: $showingAddExpenseView) {
                AddView(expenses: expenses)
            }
        }
    }
    
    func removeItems(at offsets: IndexSet) {
        expenses.items.remove(atOffsets: offsets)
    }
}

#Preview {
    ContentView()
}
