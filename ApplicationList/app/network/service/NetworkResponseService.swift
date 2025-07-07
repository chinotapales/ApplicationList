//
//  NetworkResponseService.swift
//  ApplicationList
//
//  Created by Carlo Gabriel Tapales on 06/07/2025.
//

import Foundation
import Alamofire

protocol NetworkResponseServiceType {
    @discardableResult
    func performRequest(from route: NetworkRoute, completion: @escaping(Swift.Result<Void, Error>) -> Void) -> DataRequest
    @discardableResult
    func performRequest<T: Codable>(from route: NetworkRoute, completion: @escaping(Swift.Result<T, Error>) -> Void) -> DataRequest
    @discardableResult
    func performRequest<T: Codable>(from route: NetworkRoute, completion: @escaping(Swift.Result<[T], Error>) -> Void) -> DataRequest
}

struct NetworkResponseService: NetworkResponseServiceType {
    let networkService: NetworkServiceType
    
    init(networkService: NetworkServiceType) {
        self.networkService = networkService
    }
    
    @discardableResult
    func performRequest(from route: NetworkRoute, completion: @escaping(Swift.Result<Void, Error>) -> Void) -> DataRequest {
        networkService.performRequest(route: route) { result in
            switch result {
            case .success(_):
                completion(.success(()))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    @discardableResult
    func performRequest<T: Codable>(from route: NetworkRoute, completion: @escaping(Swift.Result<T, Error>) -> Void) -> DataRequest {
        networkService.performRequest(route: route) { result in
            switch result {
            case .success(let data):
                do {
                    let parsedData: T = try networkService.dataParser.parse(data: data)
                    completion(.success(parsedData))
                }
                catch let error {
                    completion(.failure(error))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    @discardableResult
    func performRequest<T: Codable>(from route: NetworkRoute, completion: @escaping(Swift.Result<[T], Error>) -> Void) -> DataRequest {
        networkService.performRequest(route: route) { result in
            switch result {
            case .success(let data):
                do {
                    let parsedArray: [T] = try networkService.dataParser.parseArray(data: data)
                    completion(.success(parsedArray))
                }
                catch let error {
                    completion(.failure(error))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
