//
//  ReachabilityChecker.swift
//  ApplicationList
//
//  Created by Carlo Gabriel Tapales on 06/07/2025.
//


import Foundation
import Alamofire

class ReachabilityChecker {
    
    class var isConnectedToInternet: Bool {
        return NetworkReachabilityManager()!.isReachable
    }
    
}
