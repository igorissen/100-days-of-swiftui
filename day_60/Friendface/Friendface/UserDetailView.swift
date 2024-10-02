//
//  UserDetailView.swift
//  Friendface
//
//  Created by Ismael Gorissen on 02/10/2024.
//

import SwiftUI

struct UserDetailView: View {
    let user: User
    let users: [User]

    var body: some View {
        List {
            Section {
                Label(String(user.age), systemImage: "birthday.cake")
                Label(user.email, systemImage: "envelope")
                Label(user.registeredFormatted, systemImage: "calendar")
                Label(user.company, systemImage: "briefcase")
                Label(user.address, systemImage: "mappin.and.ellipse")
            } header: {
                Text("Information")
            }
            .headerProminence(.increased)

            Section {
                Text(user.about)
            } header: {
                Text("About")
            }
            .headerProminence(.increased)

            Section {
                ForEach(user.friends, id: \.id) { friend in
                    NavigationLink {
                        if let foundUser = getUser(by: friend.id) {
                            UserDetailView(user: foundUser, users: users)
                        }
                    } label: {
                        Text(friend.name)
                            .foregroundStyle(.black)
                    }
                }
            } header: {
                Text("Friends")
            }
            .headerProminence(.increased)
        }
        .navigationTitle(user.name)
        .toolbar {
            Label(user.isActive ? "Online" : "Offline", systemImage: "antenna.radiowaves.left.and.right.circle.fill")
                .foregroundStyle(user.isActive ? .green : .red)
        }
    }

    func getUser(by id: UUID) -> User? {
        if let user = users.first(where: { user in user.id == id }) {
            return user
        }

        return nil
    }
}

#Preview {
    UserDetailView(user: User.example, users: [User]())
}
