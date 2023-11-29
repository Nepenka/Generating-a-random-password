//
//  CoreDataStack.swift
//  Generating a random password
//
//  Created by 123 on 29.11.23.
//

import Foundation

import CoreData

class CoreDataStack {
    static let shared = CoreDataStack()
    
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "PasswordModel")
        container.loadPersistentStores { _, error in
            if let error = error {
                fatalError("Ошибка при загрузке хранилища данных CoreData: \(error)")
            }
        }
        return container
    }()
    
    var context: NSManagedObjectContext {
        return persistentContainer.viewContext
    }
    
    func saveContext() {
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Ошибка при сохранении контекста CoreData: \(nserror), \(nserror.userInfo)")
            }
        }
    }
}
