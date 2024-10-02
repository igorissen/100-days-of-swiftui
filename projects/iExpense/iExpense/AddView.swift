//
//  AddView.swift
//  iExpense
//
//  Created by Ismael Gorissen on 16/09/2024.
//

import SwiftData
import SwiftUI

struct AddView: View {
    @Environment(\.modelContext) var modelContext
    @Environment(\.dismiss) var dismiss

    @State private var name = "Expense Name"
    @State private var type = "Personal"
    @State private var amount = 0.0

    static let types = ["Business", "Personal", "Savings", "Leisure", "Education"]

    var body: some View {
        Form {
            //            TextField("Name", text: $name)

            Picker("Type", selection: $type) {
                ForEach(Self.types, id: \.self) {
                    Text($0)
                }
            }

            TextField(
                "Amount", value: $amount,
                format: .currency(code: Locale.current.currency?.identifier ?? "USD")
            )
            .keyboardType(.decimalPad)
        }
        .navigationTitle($name)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .cancellationAction) {
                Button("Cancel", role: .cancel) {
                    dismiss()
                }
            }

            ToolbarItem(placement: .confirmationAction) {
                Button("Save") {
                    let expense = ExpenseItem(name: name, type: type, amount: amount)
                    modelContext.insert(expense)
                    dismiss()
                }
            }
        }
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    AddView()
        .modelContainer(for: ExpenseItem.self)
}
