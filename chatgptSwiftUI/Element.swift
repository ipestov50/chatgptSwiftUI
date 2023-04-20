//
//  Element.swift
//  chatgptSwiftUI
//
//  Created by Ivan Pestov on 20.04.2023.
//

import Foundation
import SwiftUI

class Element: Identifiable, ObservableObject {
    let id = UUID()
    let name: String
    @Published var isFavorite: Bool

    init(name: String, isFavorite: Bool = false) {
        self.name = name
        self.isFavorite = isFavorite
    }
}




