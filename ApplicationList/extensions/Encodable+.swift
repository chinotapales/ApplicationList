//
//  Encodable+.swift
//  ApplicationList
//
//  Created by Carlo Gabriel Tapales on 06/07/2025.
//

import Foundation

extension Encodable {
    func toDictionary(_ encoder: JSONEncoder = JSONEncoder()) throws -> [String: Any] {
        let data = try encoder.encode(self)
        let object = try JSONSerialization.jsonObject(with: data)
        
        if let json = object as? [String: Any] {
            return json
        }
        
        let context = DecodingError.Context(codingPath: [], debugDescription: "Deserialized object is not a dictionary")
        throw DecodingError.typeMismatch(type(of: object), context)
    }
}
