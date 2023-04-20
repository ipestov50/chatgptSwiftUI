//
//  ElementListViewModel.swift
//  chatgptSwiftUI
//
//  Created by Ivan Pestov on 20.04.2023.
//
// ElementListViewModel.swift

import Foundation
import Combine

public class ElementListViewModel: ObservableObject {
    @Published var searchText = ""
    @Published var elements = [
        Element(name: "Computer"),
        Element(name: "Monitor"),
        Element(name: "Keyboard"),
        Element(name: "Mouse"),
        Element(name: "Headphones"),
        Element(name: "Printer")
    ]
    
    private(set) var filteredElements: [Element] = []

    private var cancellable: AnyCancellable?

    public init() {
        cancellable = $searchText
            .debounce(for: 0.3, scheduler: DispatchQueue.main)
            .sink { searchText in
                self.updateFilteredElements(searchText: searchText)
            }
    }

    private func updateFilteredElements(searchText: String) {
        let (startsWith, contains) = elements.reduce(([], [])) { (result, element) -> ([Element], [Element]) in
            var (startsWith, contains) = result
            if element.name.range(of: searchText, options: [.anchored, .caseInsensitive, .diacriticInsensitive]) != nil {
                startsWith.append(element)
            } else if element.name.range(of: searchText, options: [.caseInsensitive, .diacriticInsensitive]) != nil {
                contains.append(element)
            }
            return (startsWith, contains)
        }

        self.filteredElements = searchText.isEmpty ? [] : startsWith + contains
    }
    
    public func toggleFavorite(element: Element) {
        if let index = elements.firstIndex(where: { $0.id == element.id }) {
            elements[index].isFavorite.toggle()
            updateFilteredElements(searchText: searchText)
        }
    }

    @Published public var isLoading = false {
        didSet {
            if isLoading {
                filteredElements = []
            }
        }
    }
}






