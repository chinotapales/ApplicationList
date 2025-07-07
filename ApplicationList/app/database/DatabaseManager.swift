//
//  DatabaseManager.swift
//  ApplicationList
//
//  Created by Carlo Gabriel Tapales on 06/07/2025.
//

import Foundation
import RealmSwift

protocol DatabaseManagerType {
    func create<T: Object>(_ object: T.Type, completion: @escaping ((T) -> Void)) throws
    func save(object: Object) throws
    func update(object: Object) throws
    func fetch<T: Object>(_ object: T.Type, predicate: NSPredicate?, completion: (([T]) -> ())) throws
    func delete(object: Object) throws
    func deleteAll<T: Object>(_ object: T.Type) throws
}

public struct DatabaseManager: DatabaseManagerType {
    let databaseProvider: DatabaseProviderType
    
    init(databaseProvider: DatabaseProviderType) {
        self.databaseProvider = databaseProvider
    }
    
    func create<T: Object>(_ object: T.Type, completion: @escaping (T) -> Void) throws {
        let realm = try databaseProvider.getDatabase()
        try realm.write {
            let newObject = realm.create(object, value: [], update: .all)
            completion(newObject)
        }
    }
    
    func save(object: Object) throws {
        let realm = try databaseProvider.getDatabase()
        try realm.write {
            realm.add(object)
        }
    }
    
    func update(object: Object) throws {
        let realm = try databaseProvider.getDatabase()
        try realm.write {
            realm.add(object, update: .modified)
        }
    }
    
    func fetch<T: Object>(_ object: T.Type, predicate: NSPredicate?, completion: ([T]) -> ()) throws {
        let realm = try databaseProvider.getDatabase()
        var objects = realm.objects(object)
        if let predicate {
            objects = objects.filter(predicate)
        }
        completion(objects.compactMap(\.self))
    }
    
    func delete(object: Object) throws {
        let realm = try databaseProvider.getDatabase()
        try realm.write {
            realm.delete(object)
        }
    }
    
    func deleteAll<T: Object>(_ object: T.Type) throws {
        let realm = try databaseProvider.getDatabase()
        let objects = realm.objects(object)
        try realm.write {
            realm.delete(objects)
        }
    }
    
}
