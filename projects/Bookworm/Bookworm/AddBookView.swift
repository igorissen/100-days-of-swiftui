//
//  AddBookView.swift
//  Bookworm
//
//  Created by Ismael Gorissen on 25/09/2024.
//

import SwiftUI

struct AddBookView: View {
    @Environment(\.modelContext) var modelContext
    @Environment(\.dismiss) var dismiss
    
    @State private var title = ""
    @State private var author = ""
    @State private var genre = "Fantasy"
    @State private var review = ""
    @State private var rating = 3
    
    @State private var showingBadInputAlert = false
    
    let genres = ["Fantasy", "Horror", "Kids", "Mystery", "Poetry", "Romance", "Thriller"]

    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Name of book", text: $title)
                    TextField("Author's name", text: $author)
                    
                    Picker("Genre", selection: $genre) {
                        ForEach(genres, id: \.self) {
                            Text($0)
                        }
                    }
                }
                
                Section("Write a review") {
                    TextEditor(text: $review)
                    
                    RatingView(rating: $rating)
                }
                
                Section {
                    Button("Save") {
                        let book = Book(title: title, author: author, genre: genre, review: review, rating: rating)
                        
                        if book.isValid() {
                            modelContext.insert(book)
                            dismiss()
                        } else {
                            showingBadInputAlert = true
                        }
                    }
                }
            }
            .navigationTitle("Add Book")
            .alert("Missing Input Data", isPresented: $showingBadInputAlert) { } message: {
                Text("Book title or author is missing!")
            }
        }
    }
}

#Preview {
    AddBookView()
}
