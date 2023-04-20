//
//  SearchBarView.swift
//  chatgptSwiftUI
//
//  Created by Ivan Pestov on 20.04.2023.
//

import SwiftUI

struct SearchBarView: View {
    @Binding var text: String

    var body: some View {
        TextField("Search", text: $text)
            .padding(7)
            .background(Color(.systemGray6))
            .cornerRadius(8)
            .overlay(
                HStack {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.gray)
                        .padding(.leading, 8)
                    Spacer()
                }
            )
            .padding(.horizontal, 10)
    }
}



