//
//  DatabaseManager.swift
//  ApplicationList
//
//  Created by Carlo Gabriel Tapales on 06/07/2025.
//

import Foundation
import RealmSwift

protocol DatabaseProviderType {
    var realmFilePath: String { get }
    func getDatabase() throws -> Realm
    func getConfiguration() -> Realm.Configuration
}

class DatabaseProvider: DatabaseProviderType {
    private var configuration: Realm.Configuration?
    
    var realmFilePath: String {
        if let filePath = try? getDatabase().configuration.fileURL?.absoluteString {
            filePath
        } else {
            "Not Available"
        }
    }
    
    func getDatabase() throws -> Realm {
        if configuration == nil {
            configuration = getConfiguration()
        }
        return try Realm(configuration: configuration!)
    }
    
    func getConfiguration() -> Realm.Configuration {
        Realm.Configuration(
            schemaVersion: 0,
            migrationBlock: { migration, oldSchemaVersion in
                //MARK: Write Migration Code when changing DB Fields
            }
        )
    }
    
    
}
