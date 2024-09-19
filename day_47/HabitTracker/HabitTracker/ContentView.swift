//
//  ContentView.swift
//  HabitTracker
//
//  Created by Ismael Gorissen on 19/09/2024.
//

import SwiftUI

struct ContentView: View {
    @State private var habits = Activities()
    @State private var showingAddActivitySheet = false
    
    var body: some View {
        NavigationStack {
            List(habits.activities) { activity in
                NavigationLink {
                    ActivityDetailView(habits: habits, activity: activity)
                } label: {
                    HStack {
                        Text(activity.title)
                        Spacer()
                        Text(String(activity.completionCount))
                            .font(.caption.weight(.black))
                            .padding(5)
                            .frame(minWidth: 50)
                            .background(color(for: activity))
                            .foregroundStyle(.white)
                            .clipShape(.capsule)
                    }
                }
            }
            .navigationTitle("Habits")
            .toolbar {
                Button("Add new activity", systemImage: "plus") {
                    showingAddActivitySheet = true
                }
            }
            .sheet(isPresented: $showingAddActivitySheet) {
                AddActivity(habits: habits)
            }
        }
    }
    
    func color(for activity: Activity) -> Color {
        if activity.completionCount < 3 {
            return .red
        }
        if activity.completionCount < 10 {
            return .orange
        }
        if activity.completionCount < 20 {
            return .green
        }
        if activity.completionCount < 50 {
            return .blue
        }
        
        return .indigo
    }
}

#Preview {
    ContentView()
}
