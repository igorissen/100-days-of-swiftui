//
//  AddActivity.swift
//  HabitTracker
//
//  Created by Ismael Gorissen on 19/09/2024.
//

import SwiftUI

struct AddActivity: View {
    @Environment(\.dismiss) var dismiss
    
    @State private var title = ""
    @State private var description = ""
    
    var habits: Activities

    var body: some View {
        NavigationStack {
            Form {
                TextField("Title", text: $title)
                TextField("Description", text: $description)
            }
            .navigationTitle("Add Activity")
            .toolbar {
                Button("Save") {
                    let trimmedTitle = title.trimmingCharacters(in: .whitespacesAndNewlines)
                    guard trimmedTitle.isEmpty == false else { return }
                    
                    let activity = Activity(title: trimmedTitle, description: description)
                    habits.activities.append(activity)
                    dismiss()
                }
            }
        }
    }
}

#Preview {
    AddActivity(habits: Activities())
}
