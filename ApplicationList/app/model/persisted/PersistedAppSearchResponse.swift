//
//  PersistedAppSearchResponse.swift
//  ApplicationList
//
//  Created by Carlo Gabriel Tapales on 06/07/2025.
//

import Foundation
import RealmSwift

final class PersistedAppSearchResponse: Object, Identifiable {
    @Persisted(primaryKey: true) var searchTerm: String
    @Persisted var resultCount: Int
    @Persisted var results: List<PersistedAppInfo> = .init()
}
