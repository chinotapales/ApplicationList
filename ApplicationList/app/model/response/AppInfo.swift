//
//  swift
//  ApplicationList
//
//  Created by Carlo Gabriel Tapales on 06/07/2025.
//

import Foundation
import RealmSwift

public struct AppInfo: Codable {
    public let trackId: Int
    public let trackName: String
    public let sellerName: String
    public let artistName: String
    public let description: String?
    public let price: Double?
    public let currency: String?
    public let formattedPrice: String?
    public let averageUserRating: Double?
    public let artworkUrl60: String?
    public let artworkUrl100: String?
    public let artworkUrl512: String?
    
    public init(trackId: Int,
         trackName: String,
         sellerName: String,
         artistName: String,
         description: String? = nil,
         price: Double? = nil,
         currency: String? = nil,
         formattedPrice: String? = nil,
         averageUserRating: Double? = nil,
         artworkUrl60: String? = nil,
         artworkUrl100: String? = nil,
         artworkUrl512: String? = nil
    ) {
        self.trackId = trackId
        self.trackName = trackName
        self.sellerName = sellerName
        self.artistName = artistName
        self.description = description
        self.price = price
        self.currency = currency
        self.formattedPrice = formattedPrice
        self.averageUserRating = averageUserRating
        self.artworkUrl60 = artworkUrl60
        self.artworkUrl100 = artworkUrl100
        self.artworkUrl512 = artworkUrl512
    }
}

extension AppInfo: EmbeddedObjectMappableType {
    func toEmbeddedObject() -> PersistedAppInfo {
        let embeddedObject = PersistedAppInfo()
        
        embeddedObject.trackId = trackId
        embeddedObject.trackName = trackName
        embeddedObject.sellerName = sellerName
        embeddedObject.artistName = artistName
        embeddedObject.descriptionString = description
        embeddedObject.price = price
        embeddedObject.currency = currency
        embeddedObject.formattedPrice = formattedPrice
        embeddedObject.averageUserRating = averageUserRating
        embeddedObject.artworkUrl60 = artworkUrl60
        embeddedObject.artworkUrl100 = artworkUrl100
        embeddedObject.artworkUrl512 = artworkUrl512
        
        return embeddedObject
    }
    
    static func toResponseType(_ embeddedObject: PersistedAppInfo) -> AppInfo {
        AppInfo(
            trackId: embeddedObject.trackId,
            trackName: embeddedObject.trackName,
            sellerName: embeddedObject.sellerName,
            artistName: embeddedObject.artistName,
            description: embeddedObject.descriptionString,
            price: embeddedObject.price,
            currency: embeddedObject.currency,
            formattedPrice: embeddedObject.formattedPrice,
            averageUserRating: embeddedObject.averageUserRating,
            artworkUrl60: embeddedObject.artworkUrl60,
            artworkUrl100: embeddedObject.artworkUrl60,
            artworkUrl512: embeddedObject.artworkUrl512
        )
    }
}
