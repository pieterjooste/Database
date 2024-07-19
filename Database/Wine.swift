//
//  Wine.swift
//  Database
//
//  Created by Pieter Jooste on 2024/07/17.
//

import Foundation
import SwiftData

@Model
class Wine {
    var estate: String
    var cultivar: String
    var year: String
    var date: Date
    var place: String
    var share: String
    var price: String
    var rating: Int
    var source: String
    var comment: String
    
    init(estate: String = "Nederburg", cultivar: String = "", year: String = "2024", date: Date = .now, place: String = "", share: String = "", price: String = "R100", rating: Int = 4, source: String = "", comment: String = "") {
        self.estate = estate
        self.cultivar = cultivar
        self.year = year
        self.date = date
        self.place = place
        self.share = share
        self.price = price
        self.rating = rating
        self.source = source
        self.comment = comment
    }
}
