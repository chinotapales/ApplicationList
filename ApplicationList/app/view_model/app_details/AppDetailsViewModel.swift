//
//  AppDetailsViewModel.swift
//  ApplicationList
//
//  Created by Carlo Gabriel Tapales on 06/07/2025.
//

import UIKit
import Foundation

class AppDetailsViewModel {
    var trackName: String
    var sellerName: String
    var artistName: String
    var description: String?
    var formattedPrice: String?
    var averageUserRating: String?
    var imageUrl: URL?
    
    init(appInfo: AppInfo) {
        self.trackName = appInfo.trackName
        self.sellerName = appInfo.sellerName
        self.artistName = appInfo.artistName
        self.description = appInfo.description
        self.formattedPrice = appInfo.formattedPrice
        self.averageUserRating = appInfo.averageUserRating?.toRoundedString()
        self.imageUrl = appInfo.artworkUrl512.toURL()
    }
    
}
