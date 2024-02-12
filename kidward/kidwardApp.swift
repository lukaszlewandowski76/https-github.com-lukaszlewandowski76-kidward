//
//  kidwardApp.swift
//  kidward
//
//  Created by Łukasz Lewandowski on 12/02/2024.
//

import SwiftUI

@main
struct kidwardApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
