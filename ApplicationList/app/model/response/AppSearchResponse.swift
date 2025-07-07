//
//  AppSearchResponse.swift
//  ApplicationList
//
//  Created by Carlo Gabriel Tapales on 06/07/2025.
//

import Foundation
import RealmSwift

public struct AppSearchResponse: Codable {
    public let resultCount: Int
    public let results: [AppInfo]
    
    public init(resultCount: Int, results: [AppInfo]) {
        self.resultCount = resultCount
        self.results = results
    }
}

extension AppSearchResponse: ObjectMappableType {
    func toObject(id: String) -> PersistedAppSearchResponse {
        let persistedObject = PersistedAppSearchResponse()
        
        persistedObject.searchTerm = id
        persistedObject.resultCount = resultCount
        persistedObject.results.append(objectsIn: getPersistedAppInfoList(results))
        
        return persistedObject
    }
    
    func getPersistedAppInfoList(_ results: [AppInfo]) -> [PersistedAppInfo] {
        results.compactMap { $0.toEmbeddedObject() }
    }
    
    static func toResponseType(_ object: PersistedAppSearchResponse) -> AppSearchResponse {
        AppSearchResponse(
            resultCount: object.resultCount,
            results: getAppInfoList(object.results)
        )
    }
    
    static func getAppInfoList(_ persistedResults: List<PersistedAppInfo>) -> [AppInfo] {
        persistedResults.compactMap { AppInfo.toResponseType($0) }
    }
}
