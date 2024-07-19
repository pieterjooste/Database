//
//  WineListingView.swift
//  Database
//
//  Created by Pieter Jooste on 2024/07/18.
//

import SwiftData
import SwiftUI

struct WineListingView: View {
    @Environment(\.modelContext) var modelContext
    @Query(sort: [SortDescriptor(\Wine.rating, order: .reverse), SortDescriptor(\Wine.cultivar)]) var wines: [Wine]
    
    var body: some View {
        List {
            ForEach(wines) { wine in
                NavigationLink(value: wine) {
                    VStack(alignment: .leading) {
                        Text(wine.estate)
                            .font(.headline)
                        
                        Text(wine.cultivar)
                            .font(.subheadline)
                        
                        Text(wine.year)
                        
                        Text(wine.date.formatted(date: .long, time: .omitted))
                        
                        Text("Shared with: \(wine.share)")
                        
                        Text("@: \(wine.place)")
                        
                        Text("Price: \(wine.price)")
                        
                        Text("Rating: \(wine.rating)")
                        
                        Text("Source: \(wine.source)")
                        
                        Text("Comments: \(wine.comment)")
                    }
                }
            }
            .onDelete(perform: deleteWine)
        }
    }
    
    init(sort: SortDescriptor<Wine>, searchString: String) {
        _wines = Query(filter: #Predicate {
            if searchString.isEmpty {
                return true
            } else {
                return $0.estate.localizedStandardContains(searchString) || $0.cultivar.localizedStandardContains(searchString)
            }
        }, sort: [sort])
    }
    
    func deleteWine (_ indexSet: IndexSet) {
        for index in indexSet {
            let wine = wines[index]
            modelContext.delete(wine)
        }
    }
}

#Preview {
    WineListingView(sort: SortDescriptor(\Wine.cultivar), searchString: "")
}
