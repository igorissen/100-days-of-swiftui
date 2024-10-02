//
//  User.swift
//  Friendface
//
//  Created by Ismael Gorissen on 02/10/2024.
//

import Foundation

struct User: Codable {
    var id: UUID
    var isActive: Bool
    var name: String
    var age: Int
    var company: String
    var email: String
    var address: String
    var about: String
    var registered: Date
    var tags: [String]
    var friends: [Friend]
    
    var registeredFormatted: String {
        registered.formatted(date: .abbreviated, time: .omitted)
    }
    
    static let example = User(
        id: UUID(),
        isActive: true,
        name: "Gal Gadot",
        age: 27,
        company: "Pixar",
        email: "gal.gadot@user.com",
        address: "3 Rue Chair et Pain 1000 Bruxelles",
        about: "Occaecat consequat elit aliquip magna laboris dolore laboris sunt officia adipisicing reprehenderit sunt. Do in proident consectetur labore. Laboris pariatur quis incididunt nostrud labore ad cillum veniam ipsum ullamco. Dolore laborum commodo veniam nisi. Eu ullamco cillum ex nostrud fugiat eu consequat enim cupidatat. Non incididunt fugiat cupidatat reprehenderit nostrud eiusmod eu sit minim do amet qui cupidatat. Elit aliquip nisi ea veniam proident dolore exercitation irure est deserunt.",
        registered: .now,
        tags: [
            "cillum",
            "consequat",
            "deserunt",
            "nostrud",
            "eiusmod",
            "minim",
            "tempor"
        ],
        friends: [
            Friend(id: UUID(), name: "Hawkins Patel"),
            Friend(id: UUID(), name: "Jewel Sexton"),
            Friend(id: UUID(), name: "Berger Robertson")
        ]
    )
}

struct Friend: Codable {
    var id: UUID
    var name: String
}
