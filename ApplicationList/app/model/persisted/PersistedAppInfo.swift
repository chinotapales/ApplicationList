//
//  PersistedAppInfo.swift
//  ApplicationList
//
//  Created by Carlo Gabriel Tapales on 06/07/2025.
//

import Foundation
import RealmSwift

final class PersistedAppInfo: EmbeddedObject, Identifiable {
    @Persisted var trackId: Int
    @Persisted var trackName: String
    @Persisted var sellerName: String
    @Persisted var artistName: String
    @Persisted var descriptionString: String?
    @Persisted var price: Double?
    @Persisted var currency: String?
    @Persisted var formattedPrice: String?
    @Persisted var averageUserRating: Double?
    @Persisted var artworkUrl60: String?
    @Persisted var artworkUrl100: String?
    @Persisted var artworkUrl512: String?
}
