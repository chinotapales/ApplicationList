//
//  Mappable.swift
//  ApplicationList
//
//  Created by Carlo Gabriel Tapales on 06/07/2025.
//

import Foundation
import RealmSwift

protocol ObjectMappableType {
    associatedtype ObjectType: Object
    func toObject(id: String) -> ObjectType
    static func toResponseType(_ object: ObjectType) -> Self
}
