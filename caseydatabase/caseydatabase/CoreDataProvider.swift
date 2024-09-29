//
//  CoreDataProvider.swift
//  caseydatabase
//
//  Created by Casey Feng on 9/28/24.
//

import Foundation
import CoreData

class CoreDataProvider {
    
    static let shared = CoreDataProvider()
    let persistentContainer: NSPersistentContainer
    
    var viewContext: NSManagedObjectContext {
        persistentContainer.viewContext
    }
    
    private init() {

        persistentContainer = NSPersistentContainer(name: "itemModel")
        persistentContainer.loadPersistentStores { description, error in
            if let error = error {
                fatalError("Unable to initialize model \(error)")
            }
        }
    }
    
}
