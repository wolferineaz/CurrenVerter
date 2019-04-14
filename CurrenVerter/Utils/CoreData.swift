//
//  CoreData.swift
//  CurrenVerter
//
//  Created by Tabriz Dzhavadov on 13/04/2019.
//  Copyright © 2019 Tabriz Dzhavadov. All rights reserved.
//

import Foundation
import CoreData

class CoreData {

    static var manager = CoreData()

    var context: NSManagedObjectContext {
        return self.persistentContainer.viewContext
    }

    func pair() -> CurrencyPair {
        let entity = NSEntityDescription.entity(forEntityName: "CurrencyPair", in: self.context)
        return CurrencyPair.init(entity: entity!, insertInto: nil)
    }

    func save(pairWith from: Currency, to: Currency) -> CurrencyPair {
        let newPair = CurrencyPair(context: self.context)
        newPair.from = from.identifier
        newPair.to = to.identifier
        self.saveContext()
        return newPair
    }

    func pairs() -> [CurrencyPair]? {
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "CurrencyPair")
        request.returnsObjectsAsFaults = false
        do {
            let result = try context.fetch(request)
            return result as? [CurrencyPair]
        } catch {
            print("Failed")
        }
        return nil
    }

    func clear() {
        self.clear("CurrencyPair")
    }

    func clear(_ entityName: String) {
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: entityName)
        request.includesPropertyValues = false
        do {
            let result = try self.context.fetch(request)
            for data in result as! [NSManagedObject] {
                self.context.delete(data)
            }
            try self.context.save()
        } catch {

        }
    }

    // MARK: - Core Data stack

    private lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "CoreData")
        container.loadPersistentStores(completionHandler: { (_, error) in
            if let error = error as NSError? {
                //TODO: handle
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    // MARK: - Core Data Saving support

    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                //TODO: handle
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }

}
