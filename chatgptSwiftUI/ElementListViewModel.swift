//
//  ElementListViewModel.swift
//  chatgptSwiftUI
//
//  Created by Ivan Pestov on 20.04.2023.
//
// ElementListViewModel.swift

import SwiftUI
import Combine

class ElementListViewModel: ObservableObject {
    @Published var searchText = ""
    @Published var isLoading = false
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
    private var dataService = ElementDataService()

    init() {
        cancellable = $searchText
            .debounce(for: 0.3, scheduler: DispatchQueue.main)
            .sink { searchText in
                self.updateFilteredElements(searchText: searchText)
            }
    }

    private func updateFilteredElements(searchText: String) {
        isLoading = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            let (startsWith, contains) = self.elements.reduce(([], [])) { (result, element) -> ([Element], [Element]) in
                var (startsWith, contains) = result
                if element.name.range(of: searchText, options: [.anchored, .caseInsensitive, .diacriticInsensitive]) != nil {
                    startsWith.append(element)
                } else if element.name.range(of: searchText, options: [.caseInsensitive, .diacriticInsensitive]) != nil {
                    contains.append(element)
                }
                return (startsWith, contains)
            }

            self.filteredElements = searchText.isEmpty ? [] : startsWith + contains
            self.isLoading = false
        }
    }
    
    func toggleFavorite(element: Element) {
        dataService.toggleFavorite(element: element)
        updateFilteredElements(searchText: searchText)
    }
}







