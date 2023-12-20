//
//  IContactsApp.swift
//  IContacts
//
//  Created by Praful Argiddi on 20/12/23.
//

import SwiftUI

@main
struct IContactsApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
