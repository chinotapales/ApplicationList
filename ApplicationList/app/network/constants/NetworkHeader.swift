//
//  NetworkHeader.swift
//  ApplicationList
//
//  Created by Carlo Gabriel Tapales on 06/07/2025.
//

import Foundation

enum NetworkHeader {
    case accept
    case contentType
    case authorization
    
    var key: String {
        switch self {
        case .accept:
            "Accept"
        case .contentType:
            "Content-Type"
        case .authorization:
            "Authorization"
        }
    }
    
    var value: String {
        switch self {
        case .accept:
            "*/*"
        case .contentType:
            "application/json"
        default:
            ""
        }
    }
    
    func toURLQueryItem() -> URLQueryItem {
         URLQueryItem(name: key, value: value)
    }
}
