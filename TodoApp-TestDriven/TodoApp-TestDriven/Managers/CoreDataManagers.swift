//
//  CoreDataManagers.swift
//  TodoApp-TestDriven
//
//  Created by Meric Alp on 29.03.2023.
//

import Foundation
import CoreData

class CoreDataManager {
    
    let persistentContainer: NSPersistentContainer
    static let shared: CoreDataManager = CoreDataManager()
    
    private init() {
        persistentContainer = NSPersistentContainer(name: "TodoApp_TestDriven")
        persistentContainer.loadPersistentStores { description, error in
            if let error = error {
                fatalError("Unable to initialize Core Data \(error)")
            }
        }
        
        
    }
    
}
