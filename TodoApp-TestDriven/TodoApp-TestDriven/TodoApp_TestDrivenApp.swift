//
//  TodoApp_TestDrivenApp.swift
//  TodoApp-TestDriven
//
//  Created by Meric Alp on 29.03.2023.
//

import SwiftUI

@main
struct TodoApp_TestDrivenApp: App {    
    let persistenceContainer = CoreDataManager.shared.persistentContainer
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceContainer.viewContext)
        }
    }
}
