//
//  DatabaseApp.swift
//  Database
//
//  Created by Pieter Jooste on 2024/07/15.
//

import SwiftData
import SwiftUI

@main
struct DatabaseApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Wine.self)
    }
}
