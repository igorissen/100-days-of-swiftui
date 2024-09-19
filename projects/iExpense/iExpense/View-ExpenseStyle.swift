//
//  View-ExpenseStyle.swift
//  iExpense
//
//  Created by Ismael Gorissen on 16/09/2024.
//

import SwiftUI

extension View {
    func style(for item: ExpenseItem) -> some View {
        if item.amount < 10 {
            return self.foregroundStyle(.green)
        }
        
        if item.amount < 100 {
            return self.foregroundStyle(.yellow)
        }
        
        return self.foregroundStyle(.red)
    }
}
