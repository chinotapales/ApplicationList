//
//  DatabaseRepository.swift
//  ApplicationList
//
//  Created by Carlo Gabriel Tapales on 06/07/2025.
//

import Foundation
import RealmSwift

protocol DatabaseRepositoryType {
    func create<T: Object>(_ object: T.Type, completion: @escaping ((T) -> Void)) throws
    func save(object: Object) throws
    func update(object: Object) throws
    func fetch<T: Object>(_ object: T.Type, predicate: NSPredicate?, completion: (([T]) -> ())) throws
    func delete(object: Object) throws
    func deleteAll<T: Object>(_ object: T.Type) throws
}

public struct DatabaseRepository: DatabaseRepositoryType {
    let databaseProvider: DatabaseProviderType
    let databaseManager: DatabaseManagerType
    
    init(databaseProvider: DatabaseProviderType) {
        self.databaseProvider = databaseProvider
        self.databaseManager = DatabaseManager(databaseProvider: databaseProvider)
        
        NSLog("🪬 Realm File Path: \(databaseProvider.realmFilePath)")
    }
    
    func create<T: Object>(_ object: T.Type, completion: @escaping ((T) -> Void)) throws {
        try databaseManager.create(object, completion: completion)
    }
    
    func save(object: Object) throws {
        try databaseManager.save(object: object)
    }
    
    func update(object: Object) throws {
        try databaseManager.update(object: object)
    }
    
    func fetch<T: Object>(_ object: T.Type, predicate: NSPredicate?, completion: ([T]) -> ()) throws {
        try databaseManager.fetch(object, predicate: predicate, completion: completion)
    }
    
    func delete(object: Object) throws {
        try databaseManager.delete(object: object)
    }
    
    func deleteAll<T: Object>(_ object: T.Type) throws {
        try databaseManager.deleteAll(object)
    }
}
