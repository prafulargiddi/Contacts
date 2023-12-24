//
//  CoreDataWrapper.swift
//  IContacts
//
//  Created by Praful Argiddi on 20/12/23.
//

import Foundation
import CoreData
class CoreDataWrapper: CoreDataWrapperProtocol {
    
    var container: NSPersistentContainer!
    init() {
        self.container = NSPersistentContainer(name: "IContacts")
        container.loadPersistentStores { storeDescription, error in
            if let error = error {
                print("Unresolved error\(error.localizedDescription)")
            }
        }
        container.viewContext.automaticallyMergesChangesFromParent = true
        /*add necessary support for migration*/
           let description = NSPersistentStoreDescription()
           description.shouldMigrateStoreAutomatically = true
           description.shouldInferMappingModelAutomatically = true
           container.persistentStoreDescriptions =  [description]
           /*add necessary support for migration*/
    }
    func getData(entityName: String) throws -> [NSManagedObject] {
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: entityName)
        let entities = try container.viewContext.fetch(fetchRequest)
        return entities
    }
    
    func getData(entityName: String, predicate: NSPredicate) throws -> [NSManagedObject] {
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: entityName)
        fetchRequest.predicate = predicate
        let entities = try container.viewContext.fetch(fetchRequest)
        return entities
    }
    
    func getData(entityName: String, predicate: NSPredicate, limit: Int) throws -> [NSManagedObject] {
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: entityName)
        fetchRequest.predicate = predicate
        fetchRequest.fetchLimit = limit
        let entities = try container.viewContext.fetch(fetchRequest)
        return entities
    }
    
    func deleteEntity(entity: NSManagedObject) throws {
        container.viewContext.delete(entity)
    }
    
    func saveEntity(entity: NSManagedObject) throws {
        if(container.viewContext.hasChanges){
            try  container.viewContext.save()
        }
    }
    
    func getContext() -> NSManagedObjectContext {
        return container.viewContext
    }
    
}
