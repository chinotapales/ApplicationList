//
//  AppListViewModel.swift
//  ApplicationList
//
//  Created by Carlo Gabriel Tapales on 06/07/2025.
//

import UIKit

protocol AppListViewModelType {
    var appInfoDataSource: [AppListTableViewCellViewModel] { get }
    var searchResults: [AppInfo] { get }
    var onLoading: (() -> Void)? { get set }
    var onSearchResponse: (() -> Void)? { get set }
    var onError: ((Error) -> Void)? { get set }
    func clearSearchResults()
    func setSearchResults(appSearchResponse: AppSearchResponse)
    func search(term: String)
    func getStoredResponse(term: String)
}

final class AppListViewModel: AppListViewModelType {
    private let dataRepository: DataRepositoryType
    private let databaseRepository: DatabaseRepositoryType
    
    var appInfoDataSource: [AppListTableViewCellViewModel] = []
    var searchResults: [AppInfo] = []
    var onLoading: (() -> Void)?
    var onSearchResponse: (() -> Void)?
    var onError: ((Error) -> Void)?
    
    init(dataRepository: DataRepositoryType, databaseRepository: DatabaseRepositoryType) {
        self.dataRepository = dataRepository
        self.databaseRepository = databaseRepository
    }
    
    func clearSearchResults() {
        appInfoDataSource.removeAll()
        searchResults.removeAll()
        
        onSearchResponse?()
    }
    
    func setSearchResults(appSearchResponse: AppSearchResponse) {
        searchResults = appSearchResponse.results
        appInfoDataSource = searchResults.map { result in
            AppListTableViewCellViewModel(
                trackName: result.trackName,
                sellerName: result.sellerName,
                imageUrlString: result.artworkUrl100
            )
        }
    }
    
    func search(term: String) {
        onLoading?()
        dataRepository.search(term: term) { [weak self] result in
            guard let self else {
                return
            }
            switch result {
            case .success(let appSearchResponse):
                self.setSearchResults(appSearchResponse: appSearchResponse)
                self.storeResponse(term: term, appSearchResponse: appSearchResponse)
                self.onSearchResponse?()
            case .failure(let error):
                self.onError?(error)
            }
        }
    }
    
    func getStoredResponse(term: String) {
        onLoading?()
        fetchStoredResponses(term: term) { [weak self] appSearchResponseList in
            guard let self,
                  let appSearchResponse = appSearchResponseList.first
            else {
                let error = NetworkError(name: "Error", code: 996, error: NetworkError.getErrorMessage(with: 996))
                self?.onError?(error)
                return
            }
            self.setSearchResults(appSearchResponse: appSearchResponse)
            self.onSearchResponse?()
        }
    }
    
    func storeResponse(term: String, appSearchResponse: AppSearchResponse) {
        do {
            try databaseRepository.update(object: appSearchResponse.toObject(id: term))
        } catch {
            onError?(error)
        }
    }
    
    func fetchStoredResponses(term: String, completionHandler: @escaping ([AppSearchResponse]) -> Void) {
        do {
            let predicate = NSPredicate(format: "searchTerm == %@", term)
            try databaseRepository.fetch(PersistedAppSearchResponse.self, predicate: predicate) { persistedAppSearchResponseList in
                let appSearchResponseList = persistedAppSearchResponseList.compactMap {
                    AppSearchResponse.toResponseType($0)
                }
                completionHandler(appSearchResponseList)
            }
        } catch {
            onError?(error)
        }
    }
    
}
