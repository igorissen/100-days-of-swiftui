//
//  String-Extensions.swift
//  CupcakeCorner
//
//  Created by Ismael Gorissen on 22/09/2024.
//

import Foundation

extension String {
    var isReallyEmpty: Bool {
        self.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }
}
