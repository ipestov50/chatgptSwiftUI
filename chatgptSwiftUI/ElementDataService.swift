//
//  ElementDataService.swift
//  chatgptSwiftUI
//
//  Created by Ivan Pestov on 20.04.2023.
//


import Foundation

import Foundation

class ElementDataService {
    // Список всех элементов
    @Published var elements = [
        Element(name: "Computer"),
        Element(name: "Monitor"),
        Element(name: "Keyboard"),
        Element(name: "Mouse"),
        Element(name: "Headphones"),
        Element(name: "Printer")
    ]

    func toggleFavorite(element: Element) {
        if let index = elements.firstIndex(where: { $0.id == element.id }) {
            elements[index].isFavorite.toggle()
        }
    }
}




