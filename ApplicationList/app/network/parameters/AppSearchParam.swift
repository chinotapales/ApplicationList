//
//  AppSearchParam.swift
//  ApplicationList
//
//  Created by Carlo Gabriel Tapales on 06/07/2025.
//

import Foundation

public struct AppSearchParam: Encodable, Sendable {
    public let media: String
    public let entity: String
    public let country: String
    public let term: String
    
    enum CodingKeys: CodingKey {
        case media
        case entity
        case country
        case term
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        media = try container.decode(String.self, forKey: .media)
        entity = try container.decode(String.self, forKey: .entity)
        country = try container.decode(String.self, forKey: .country)
        term = try container.decode(String.self, forKey: .term)
    }
    
    public init(searchQuery: SearchQuery) {
        self.media = searchQuery.media
        self.entity = searchQuery.entity
        self.country = searchQuery.country
        self.term = searchQuery.term
    }
}
