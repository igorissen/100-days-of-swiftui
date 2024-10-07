//
//  ContentView.swift
//  Friendface
//
//  Created by Ismael Gorissen on 02/10/2024.
//

import SwiftData
import SwiftUI

struct ContentView: View {
    @Environment(\.modelContext) var modelContext
    
    @Query(sort: \User.name) private var users: [User]

    var body: some View {
        NavigationStack {
            List(users) { user in
                NavigationLink(value: user) {
                    HStack {
                        Circle()
                            .frame(width: 15)
                            .foregroundStyle(user.isActive ? .green : .red)
                        
                        Text(user.name)
                            .font(.headline)
                    }
                }
            }
            .navigationTitle("Friendface")
            .navigationDestination(for: User.self) { user in
                UserDetailView(user: user, users: users)
            }
            .task {
                await loadData()
            }
        }
    }

    func loadData() async {
        guard users.isEmpty else {
            print("Data already fetched");
            return
        }
        
        guard let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json")
        else {
            print("Invalid URL")
            return
        }

        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            
            let jsonDecoder = JSONDecoder()
            jsonDecoder.dateDecodingStrategy = .iso8601

            let downloadedUsers = try jsonDecoder.decode([User].self, from: data)
            let insertContext = ModelContext(modelContext.container)

            for user in downloadedUsers {
                insertContext.insert(user)
            }
            
            try insertContext.save()
        } catch {
            print("Invalid Data (error: \(error.localizedDescription))")
        }
    }
}

#Preview {
    ContentView()
}
