//
//  RealmEmbeddedMappable.swift
//  ApplicationList
//
//  Created by Carlo Gabriel Tapales on 06/07/2025.
//

import Foundation
import RealmSwift

protocol EmbeddedObjectMappableType {
    associatedtype EmbeddedObjectType: EmbeddedObject
    func toEmbeddedObject() -> EmbeddedObjectType
    static func toResponseType(_ embeddedObject: EmbeddedObjectType) -> Self
}
