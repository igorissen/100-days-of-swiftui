//
//  ExpenseSectionView.swift
//  iExpense
//
//  Created by Ismael Gorissen on 16/09/2024.
//

import SwiftUI

struct ExpenseSectionView: View {
    let title: String
    let expenses: [ExpenseItem]
    let deleteItems: (IndexSet) -> Void
    
    let localeCurrencyCode = Locale.current.currency?.identifier ?? "USD"
    
    var body: some View {
        Section(header: Text(title)) {
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
            .onDelete(perform: deleteItems)
        }
    }
}

#Preview {
    ExpenseSectionView(title: "Personal", expenses: []) { _ in }
}
