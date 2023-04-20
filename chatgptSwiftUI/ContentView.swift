//
//  ContentView.swift
//  chatgptSwiftUI
//
//  Created by Ivan Pestov on 20.04.2023.
//
import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel = ElementListViewModel()

    var body: some View {
        NavigationView {
            VStack {
                // Компонент SearchBar с привязкой к searchText
                SearchBar(text: $viewModel.searchText)

                // Используем ZStack для отображения индикатора активности поверх списка элементов
                ZStack {
                    // Список элементов
                    List(viewModel.filteredElements) { element in
                        ElementRow(element: element)
                    }

                    // Индикатор активности, отображается только когда isLoading равно true
                    if viewModel.isLoading {
                        ProgressView()
                            .progressViewStyle(CircularProgressViewStyle())
                            .scaleEffect(1.5) // Изменение размера индикатора активности
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

