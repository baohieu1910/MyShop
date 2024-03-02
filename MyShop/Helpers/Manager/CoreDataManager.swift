//
//  CoreDataManager.swift
//  MyShop
//
//  Created by Hieu Le on 2/28/24.
//

import Foundation
import CoreData

class CoreDataManager {
    static var shared = CoreDataManager()
    
    let persistentContainer: NSPersistentContainer
    
    var viewContext: NSManagedObjectContext {
        return persistentContainer.viewContext
    }
    
    private init() {
        persistentContainer = NSPersistentContainer(name: "DataModel")
        persistentContainer.loadPersistentStores { description, error in
            if let error = error {
                fatalError("Unable to initialize Core Data \(error)")
            }
        }
    }
}

extension CoreDataManager {
    func saveContext() {
        if viewContext.hasChanges {
            do {
                try viewContext.save()
            }
            catch {
                print("ERROR: \(error.localizedDescription)")
            }
        }
    }
        
    func getAllUsers() -> [User]{
        let request = NSFetchRequest<User>(entityName: "User")
        
        do {
            return try viewContext.fetch(request)
        } catch {
            return []
        }
    }
    
    func getAllProducts() -> [Product] {
        let request = NSFetchRequest<Product>(entityName: "Product")
        
        do {
            return try viewContext.fetch(request)
        } catch {
            return []
        }
    }
    
    func deleteProduct(product: Product) {
        viewContext.delete(product)

        do {
            try viewContext.save()
        } catch {
            print(error.localizedDescription)
        }
    }
}

private extension CoreDataManager {
    
}

