//
//  ContentView.swift
//  chatgptSwiftUI
//
//  Created by Ivan Pestov on 20.04.2023.
//
import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = ElementListViewModel()

    var body: some View {
        NavigationView {
            VStack {
                SearchBar(text: $viewModel.searchText)

                ZStack {
                    List(viewModel.filteredElements) { element in
                        ElementRow(element: $viewModel.elements[viewModel.elements.firstIndex(of: element)!])
                    }

                    if viewModel.isLoading {
                        ProgressView()
                            .progressViewStyle(CircularProgressViewStyle())
                            .scaleEffect(1.5)
                    }
                }
            }
            .navigationBarTitle("Search Elements")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

