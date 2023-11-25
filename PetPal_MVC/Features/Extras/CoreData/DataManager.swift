//
//  DataManager.swift
//  PetPal_MVC
//
//  Created by James Vieyra on 2023/11/25.
//

import UIKit
import CoreData

class DataManager: NSData, ObservableObject {
    
    lazy var container = NSPersistentContainer(name: "PetPal_MVC")
    
    override init() {
        super.init()
        container.loadPersistentStores { _, error in
            if let error = error as NSError? {
                print("Unresolved error \(error) \(error.userInfo)")
            }
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func saveContext() {
        let context = container.viewContext
        
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    func saveContext(_  context: NSManagedObjectContext) {
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
}
