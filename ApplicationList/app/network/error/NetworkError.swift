//
//  NetworkError.swift
//  ApplicationList
//
//  Created by Carlo Gabriel Tapales on 06/07/2025.
//

import Foundation

struct NetworkError: Codable, Error {
    let name: String?
    let code: Int?
    let error: String?
}

extension NetworkError {
    func getErrorMessage() -> String {
        guard let message = error else {
            return NetworkError.getErrorMessage(with: code ?? 999)
        }
        return message
    }
    
    static func getErrorMessage(with statusCode: Int) -> String {
        let errorResponse = NetworkErrorResponse(rawValue: statusCode) ?? .unknownError
        return errorResponse.message
    }
}

extension NetworkError: LocalizedError {
    var errorDescription: String? {
        getErrorMessage()
    }
}
