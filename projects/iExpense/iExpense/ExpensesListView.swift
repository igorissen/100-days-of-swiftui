//
//  ExpensesListView.swift
//  iExpense
//
//  Created by Ismael Gorissen on 16/09/2024.
//

import SwiftData
import SwiftUI

struct ExpensesListView: View {
    @Environment(\.modelContext) var modelContext
    
    @Query private var expenses: [ExpenseItem]
    
    let localeCurrencyCode = Locale.current.currency?.identifier ?? "USD"
    
    var body: some View {
        List {
            ForEach(expenses) { item in
                HStack {
                    VStack(alignment: .leading) {
                        Text(item.name)
                            .font(.headline)
                        
                        Text(item.type)
                            .font(.subheadline)
                    }
                    
                    Spacer()
                    
                    Text(item.amount, format: .currency(code: localeCurrencyCode))
                        .foregroundStyle(item.amount < 10 ? .green : item.amount < 100 ? .yellow : .red)
                }
            }
            .onDelete(perform: removeItems)
        }
    }
    
    init(type: String = "All", sortOrder: [SortDescriptor<ExpenseItem>]) {
        _expenses = Query(
            filter: #Predicate {
                if type == "All" {
                    return true
                } else {
                    return $0.type == type
                }
            },
            sort: sortOrder
        )
    }
    
    func removeItems(at offsets: IndexSet) {
        for offset in offsets {
            let item = expenses[offset]
            modelContext.delete(item)
        }
    }
}

#Preview {
    ExpensesListView(sortOrder: [SortDescriptor(\ExpenseItem.name)])
        .modelContainer(for: ExpenseItem.self)
}
