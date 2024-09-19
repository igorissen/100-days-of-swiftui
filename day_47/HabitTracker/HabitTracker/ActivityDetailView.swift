//
//  ActivityDetailView.swift
//  HabitTracker
//
//  Created by Ismael Gorissen on 19/09/2024.
//

import SwiftUI

struct ActivityDetailView: View {
    var habits: Activities
    var activity: Activity
    
    var body: some View {
        List {
            if activity.description.isEmpty == false {
                Section {
                    Text(activity.description)
                }
            }
            
            Section {
                Text("Completion count: \(activity.completionCount)")
                
                Button("Mark as completed") {
                    var newActivity = activity
                    newActivity.completionCount += 1
                    
                    if let index = habits.activities.firstIndex(of: activity) {
                        habits.activities[index] = newActivity
                    }
                }
            }
        }
    }
}

#Preview {
    ActivityDetailView(habits: Activities(), activity: .example)
}
