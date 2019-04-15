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

    func usedIdentifiers(by currency: Currency) -> [String]? {
        let pairs = self.pairs()?.filter{ $0.from == currency.identifier }
        return pairs?.map { $0.to! }
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
            let nserror = error as NSError
            fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
        }
        return nil
    }

    func clearPair(by from: String, to: String) {
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "CurrencyPair")
        request.predicate = NSPredicate.init(format: "from = %@ AND to = %@", from, to)
        do {
            let result = try self.context.fetch(request)
            for data in result as! [NSManagedObject] {
                self.context.delete(data)
            }
            try self.context.save()
        } catch {
            let nserror = error as NSError
            fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
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
