//
//  AppDetailsViewModelSpec.swift
//  ApplicationList
//
//  Created by Carlo Gabriel Tapales on 06/07/2025.
//

@testable import ApplicationList
import Foundation
import Nimble
import Quick

class AppDetailsViewModelSpec: QuickSpec {
    override class func spec() {
        var target: AppDetailsViewModel!
        
        beforeEach {
            let mockAppInfo = getMockAppInfo()
            target = AppDetailsViewModel(appInfo: mockAppInfo)
        }
        
        describe("App Details View Model") {
            it("Should check if the correct values have been set") {
                expect(target.trackName).to(equal("X"))
                expect(target.sellerName).to(equal("TWITTER INTERNATIONAL UNLIMITED COMPANY"))
                expect(target.artistName).to(equal("X Corp."))
                expect(target.averageUserRating).to(equal("4.58"))
                expect(target.formattedPrice).to(equal("Free"))
                expect(target.imageUrl?.absoluteString).to(equal("https://is1-ssl.mzstatic.com/image/thumb/Purple221/v4/85/37/41/85374178-13dc-1a75-f304-d66cedc3de1c/ProductionAppIcon-0-0-1x_U007emarketing-0-8-0-0-0-85-220.png/512x512bb.jpg"))
                
            }
        }
    }
    
    static func getMockAppInfo() -> AppInfo {
        AppInfo(
            trackId: 333903271,
            trackName: "X",
            sellerName: "TWITTER INTERNATIONAL UNLIMITED COMPANY",
            artistName: "X Corp.",
            price: 0.00,
            currency: "GBP",
            formattedPrice: "Free",
            averageUserRating: 4.57629,
            artworkUrl60: "https://is1-ssl.mzstatic.com/image/thumb/Purple221/v4/85/37/41/85374178-13dc-1a75-f304-d66cedc3de1c/ProductionAppIcon-0-0-1x_U007emarketing-0-8-0-0-0-85-220.png/60x60bb.jpg",
            artworkUrl100: "https://is1-ssl.mzstatic.com/image/thumb/Purple221/v4/85/37/41/85374178-13dc-1a75-f304-d66cedc3de1c/ProductionAppIcon-0-0-1x_U007emarketing-0-8-0-0-0-85-220.png/100x100bb.jpg",
            artworkUrl512: "https://is1-ssl.mzstatic.com/image/thumb/Purple221/v4/85/37/41/85374178-13dc-1a75-f304-d66cedc3de1c/ProductionAppIcon-0-0-1x_U007emarketing-0-8-0-0-0-85-220.png/512x512bb.jpg"
        )
    }
}
