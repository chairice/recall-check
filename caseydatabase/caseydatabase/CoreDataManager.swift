//
//  CoreDataManager.swift
//  caseydatabase
//
//  Created by Casey Feng on 9/29/24.
//

import Foundation
import CoreData

class CoreDataManager {
    static let shared = CoreDataManager()
    let persistentContainer: NSPersistentContainer

    private init() {
        persistentContainer = NSPersistentContainer(name: "YourProjectName")
        persistentContainer.loadPersistentStores { _, error in
            if let error = error {
                fatalError("Failed to load Core Data stack: \(error)")
            }
        }
    }

    func saveProduct(product: ProductWrapper) {
        let context = persistentContainer.viewContext
        let newProduct = Item_S(context: context)
        newProduct.barcode = product.barcode
        newProduct.name = product.name
        newProduct.date = product.date
        newProduct.recalled = Int32(product.recalled)

        do {
            try context.save()
        } catch {
            print("Failed to save product: \(error)")
        }
    }

    func fetchProducts() -> [Item_S] {
        let context = persistentContainer.viewContext
        let request: NSFetchRequest<Item_S> = Item_S.fetchRequest()
        do {
            return try context.fetch(request)
        } catch {
            print("Failed to fetch products: \(error)")
            return []
        }
    }
}
