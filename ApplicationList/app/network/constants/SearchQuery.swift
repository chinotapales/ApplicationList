//
//  SearchQuery.swift
//  ApplicationList
//
//  Created by Carlo Gabriel Tapales on 06/07/2025.
//

public enum SearchQuery {
    case softwareUK(term: String)
    
    var media: String {
        switch self {
        case .softwareUK:
            "software"
        }
    }
    
    var entity: String {
        switch self {
        case .softwareUK:
            "software"
        }
    }
    
    var country: String {
        switch self {
        case .softwareUK:
            "gb"
        }
    }
    
    var term: String {
        switch self {
        case let .softwareUK(term):
            term
        }
    }
    
}
