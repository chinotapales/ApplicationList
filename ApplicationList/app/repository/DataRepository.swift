//
//  DataRepository.swift
//  ApplicationList
//
//  Created by Carlo Gabriel Tapales on 06/07/2025.
//

import Foundation
import Alamofire

protocol DataRepositoryType {
    func search(term: String, completion: @escaping (Swift.Result<AppSearchResponse, Error>) -> Void)
}

public struct DataRepository: DataRepositoryType {
    let networkService: NetworkServiceType
    let networkResponseService: NetworkResponseServiceType
    
    init(networkService: NetworkServiceType) {
        self.networkService = networkService
        self.networkResponseService = NetworkResponseService(networkService: networkService)
    }
    
    func search(term: String, completion: @escaping (Swift.Result<AppSearchResponse, Error>) -> Void) {
        let appSearchParam = AppSearchParam(searchQuery: .softwareUK(term: term))
        networkResponseService.performRequest(from: .search(appSearchParam: appSearchParam), completion: completion)
    }
    
}
