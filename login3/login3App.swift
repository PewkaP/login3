//
//  login3App.swift
//  login3
//
//  Created by Piotr Plewka on 04/06/2024.
//

import SwiftUI

@main
struct login3App: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
            
        }
    }
}
