//
//  String-Extensions.swift
//  Bookworm
//
//  Created by Ismael Gorissen on 26/09/2024.
//

import Foundation

extension String {
    var isReallyEmpty: Bool {
        self.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }
}
