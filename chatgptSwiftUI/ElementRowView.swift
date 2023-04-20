//
//  ElementRowView.swift
//  chatgptSwiftUI
//
//  Created by Ivan Pestov on 20.04.2023.
//

import SwiftUI

struct ElementRow: View {
    @ObservedObject var element: Element

    var body: some View {
        HStack {
            Text(element.name)
            Spacer()
            Image(systemName: element.isFavorite ? "heart.fill" : "heart")
                .foregroundColor(element.isFavorite ? .red : .gray)
                .onTapGesture {
                    element.isFavorite.toggle()
                }
        }
    }
}








