//
//  DataParser.swift
//  ApplicationList
//
//  Created by Carlo Gabriel Tapales on 06/07/2025.
//

import Foundation

public struct DataParser {
    private var jsonDecoder: JSONDecoder
    
    init() {
        self.jsonDecoder = JSONDecoder()
        self.jsonDecoder.keyDecodingStrategy = .useDefaultKeys
    }
    
    func parse<T: Codable>(data: Data) throws -> T {
        return try jsonDecoder.decode(T.self, from: data)
    }
    
    func parseArray<T: Codable>(data: Data) throws -> [T] {
        return try jsonDecoder.decode([T].self, from: data)
    }
    
}
