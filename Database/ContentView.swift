//
//  ContentView.swift
//  Database
//
//  Created by Pieter Jooste on 2024/07/15.
//

import SwiftData
import SwiftUI

struct ContentView: View {
    @Environment(\.modelContext) var modelContext
   
    @State private var path = [Wine]()
    @State private var sortOrder = SortDescriptor(\Wine.estate)
    @State private var searchText = ""
    
    var body: some View {
        NavigationStack(path: $path) {
            WineListingView(sort: sortOrder, searchString: searchText)
                .navigationTitle("iWines")
                .navigationDestination(for: Wine.self, destination: EditWineView.init)
                .searchable(text: $searchText, prompt: "Estates or Cultivars")
                .toolbar {
                    Button("Add Wine", systemImage: "plus", action: addWine)
                    
                    Menu("Sort", systemImage: "arrow.up.arrow.down") {
                        Picker("Sort", selection: $sortOrder) {
                            Text("Estate")
                                .tag(SortDescriptor(\Wine.estate))
                            
                            Text("Cultivar")
                                .tag(SortDescriptor(\Wine.cultivar))
                            
                            Text("Date added")
                                .tag(SortDescriptor(\Wine.date))
                            
                            Text("Price")
                                .tag(SortDescriptor(\Wine.price))
                            
                            Text("Rating")
                                .tag(SortDescriptor(\Wine.rating, order: .reverse))
                        }
                        .pickerStyle(.inline)
                    }
                }
        }
    }
    
    func addWine() {
        let wine = Wine()
        modelContext.insert(wine)
        path = [wine]
    }
}

#Preview {
    ContentView()
}
