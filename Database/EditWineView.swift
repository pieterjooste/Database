//
//  EditWineView.swift
//  Database
//
//  Created by Pieter Jooste on 2024/07/18.
//

import SwiftData
import SwiftUI

struct EditWineView: View {
    @Bindable var wine: Wine
    
    var body: some View {
        Form {
            TextField("Estate", text: $wine.estate)
            TextField("Cultivar", text: $wine.cultivar)
            TextField("Year", text: $wine.year)
            DatePicker("Date", selection: $wine.date)
            TextField("Shared with", text: $wine.share)
            TextField("Place", text: $wine.place)
            TextField("Price", text: $wine.price)
            
            Section("Rating") {
                Picker("Rating", selection: $wine.rating) {
                    Text("Awful").tag(1)
                    Text("Not recommended").tag(2)
                    Text("Good").tag(3)
                    Text("Very good").tag(4)
                    Text("Excellent").tag(5)
                }
                .pickerStyle(.automatic)
            }
            
            TextField("Source", text: $wine.source)
            TextField("Comments", text: $wine.comment, axis: .vertical)
        }
        .navigationTitle("Add Wine")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    do {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: Wine.self, configurations: config)
        let example = Wine(estate: "Example Estate", cultivar: "Example details go here and will expand vertically as they are edited.")
        return EditWineView(wine: example).modelContainer(container)
    } catch {
        fatalError("Failed to create model container.")
    }
    
}
