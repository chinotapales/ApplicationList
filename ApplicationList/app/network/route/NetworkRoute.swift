//
//  NetworkRoute.swift
//  ApplicationList
//
//  Created by Carlo Gabriel Tapales on 06/07/2025.
//

import Foundation
import Alamofire

enum NetworkRoute: URLRequestConvertible {
    
    // MARK: - Routes
    
    // App Endpoints
    case search(appSearchParam: AppSearchParam)
    
    // MARK: - Base Host
    
    private var baseHost: String {
        switch self {
        case .search:
            return Config.itunesHostString
        }
    }
    
    // MARK: - HTTP Methods
    
    private var method: HTTPMethod {
        switch self {
        case .search:
            return .get
        }
    }
    
    // MARK: - Paths
    
    private var path: String {
        switch self {
        case .search:
            return "/search"
        }
    }
    
    // MARK: - Headers
    
    private var headers: [URLQueryItem] {
        switch self {
        default:
            return [NetworkHeader.accept.toURLQueryItem(),
                    NetworkHeader.contentType.toURLQueryItem()]
        }
    }
    
    // MARK: - Parameters
    
    private var parameters: [URLQueryItem] {
        switch self {
        case .search(let param):
            return convertParamToQueryItems(with: param)
        }
        
    }
    
    // MARK: - Body
    
    private var httpBody: [String: Any] {
        switch self {
        default:
            return [:]
        }
    }
    
    // MARK: - Query Items Conversion
    
    private func convertParamToQueryItems(with param: Encodable) -> [URLQueryItem] {
        var queryItems: [URLQueryItem] = []
        if let jsonObject = try? param.toDictionary() {
            for element in jsonObject {
                guard let stringValue = element.value as? String else {
                    continue
                }
                queryItems.append(URLQueryItem(name: element.key, value: stringValue))
            }
        }
        return queryItems
    }
    
    func asURLRequest() throws -> URLRequest {
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = baseHost
        urlComponents.path = path
        
        if !parameters.isEmpty {
            urlComponents.queryItems = parameters
        }
        
        guard let url = urlComponents.url else {
            let error = NetworkError(name: "Error", code: 998, error: NetworkError.getErrorMessage(with: 998))
            throw error
        }
        var urlRequest = URLRequest(url: url)
        
        urlRequest.httpMethod = method.rawValue
        
        for header in headers {
            urlRequest.setValue(header.value, forHTTPHeaderField: header.name)
        }
        
        if !httpBody.isEmpty {
            let jsonData = try? JSONSerialization.data(withJSONObject: httpBody)
            urlRequest.httpBody = jsonData
        }
        
        return urlRequest
    }
    
}
