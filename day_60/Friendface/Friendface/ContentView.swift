//
//  ContentView.swift
//  Friendface
//
//  Created by Ismael Gorissen on 02/10/2024.
//

import SwiftUI

struct ContentView: View {
    @State private var users = [User]()

    var body: some View {
        NavigationStack {
            List(users, id: \.id) { user in
                NavigationLink {
                    UserDetailView(user: user, users: users)
                } label: {
                    HStack {
                        Rectangle()
                            .frame(width: 15, height: 15)
                            .foregroundStyle(user.isActive ? .green : .red)
                            .clipShape(.capsule)
                        
                        Text(user.name)
                            .font(.headline)
                    }
                }
            }
            .navigationTitle("Friendface")
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

            let decoded = try jsonDecoder.decode([User].self, from: data)

            users = decoded
        } catch {
            print("Invalid Data (error: \(error.localizedDescription))")
        }
    }
}

#Preview {
    ContentView()
}
