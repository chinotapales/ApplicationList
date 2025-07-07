//
//  AppDelegate.swift
//  ApplicationList
//
//  Created by Carlo Gabriel Tapales on 06/07/2025.
//

import UIKit
import Kingfisher

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    private let imageCache = ImageCache.default
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        initImageCache()
        start()
        return true
    }
}

extension AppDelegate {
    func initImageCache() {
        //Set ImageCache in memory to last 30 minutes (30 minutes * 60 seconds)
        imageCache.memoryStorage.config.expiration = .seconds(30 * 60)
        
        //Set ImageCache in disk to last 24 hours
        imageCache.diskStorage.config.expiration = .days(1)
    }
    
    fileprivate func start() {
        let nav = UINavigationController()
        let vc = MainAssembler.shared.resolveAppListViewController()
        nav.viewControllers = [vc]
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = nav
        window?.makeKeyAndVisible()
    }
}
