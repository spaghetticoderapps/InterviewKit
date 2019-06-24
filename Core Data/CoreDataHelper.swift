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
    
    public init(managedObjectContext: NSManagedObjectContext) {
        self.managedObjectContext = managedObjectContext
    }
    
    public func printEntities() {
        let fetchRequest =
            NSFetchRequest<NSManagedObject>(entityName: "\(T.self)")
        
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
        let fetchRequest =
            NSFetchRequest<NSManagedObject>(entityName: "\(T.self)")
        
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
