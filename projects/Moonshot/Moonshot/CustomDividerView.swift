//
//  CustomDivider.swift
//  Moonshot
//
//  Created by Ismael Gorissen on 17/09/2024.
//

import SwiftUI

struct CustomDividerView: View {
    var body: some View {
        Rectangle()
            .frame(height: 2)
            .foregroundStyle(.lightBackground)
            .padding(.vertical)
    }
}

#Preview {
    CustomDividerView()
}
