//
//  AppListTableViewCellViewModel.swift
//  ApplicationList
//
//  Created by Carlo Gabriel Tapales on 06/07/2025.
//

import UIKit
import Foundation

class AppListTableViewCellViewModel {
    var trackName: String
    var sellerName: String
    var imageUrl: URL?
    
    init(trackName: String, sellerName: String, imageUrlString: String?) {
        self.trackName = trackName
        self.sellerName = sellerName
        self.imageUrl = imageUrlString.toURL()
    }
}
