//
//  CoreDataHelper.swift
//  InterviewKit
//
//  Created by Jeff Cedilla on 6/23/19.
//

import Foundation
import CoreData

public class CoreDataHelper<T> {
    
    var managedObjectContext: NSManagedObjectContext
    var fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "\(T.self)")
    
    public init(managedObjectContext: NSManagedObjectContext) {
        self.managedObjectContext = managedObjectContext
    }
    
    public var isInDataStore: Bool {
        do {
            let entities = try managedObjectContext.fetch(fetchRequest)
            return !entities.isEmpty
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
        return false
    }
   
    public func isInDataStore(_ id: Int16) -> Bool {
        do {
            fetchRequest.predicate = NSPredicate(format: "id == %d", id)
            let entities = try managedObjectContext.fetch(fetchRequest)
            return !entities.isEmpty
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
        return false
    }
    
    
    public func getALlEntities() -> [T] {
        do {
            let entities = try managedObjectContext.fetch(fetchRequest)
            return entities as! [T]
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
        return []
    }
    
    public func printEntities() {
        do {
            let entities = try managedObjectContext.fetch(fetchRequest)
            print("\n\n\n****** PRINTING \(entities.count) \(T.self) objects ******\n\n")
            entities.forEach { managedObject in
                for key in managedObject.entity.attributesByName.keys{
                    let value: Any? = managedObject.value(forKey: key)
                    print(" \(key) = \(String(describing: value))")
                }
                print("\n======\n")
            }
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
    }
    
    public func deleteEntities() {
        do {
            let entities = try managedObjectContext.fetch(fetchRequest)
            entities.forEach { managedObject in
                managedObjectContext.delete(managedObject)
            }
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
    }
    
}
