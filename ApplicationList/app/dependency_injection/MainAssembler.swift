//
//  MainAssembler.swift
//  ApplicationList
//
//  Created by Carlo Gabriel Tapales on 06/07/2025.
//

class MainAssembler {
    static let shared = MainAssembler()
    
    var dataRepository: DataRepositoryType
    var databaseRepository: DatabaseRepositoryType
    
    init() {
        self.dataRepository = DataRepository(networkService: NetworkService())
        self.databaseRepository = DatabaseRepository(databaseProvider: DatabaseProvider())
    }
    
    // MARK: AppListViewController
    
    func resolveAppListViewController() -> AppListViewController {
        let vc = AppListViewController.instanciate()
        let viewModel = AppListViewModel(dataRepository: dataRepository, databaseRepository: databaseRepository)
        
        vc.viewModel = viewModel
        return vc
    }
    
    // MARK: AppDetailsViewController
    
    func resolveAppDetailsViewController(appInfo: AppInfo) -> AppDetailsViewController {
        let vc = AppDetailsViewController.instanciate()
        let viewModel = AppDetailsViewModel(appInfo: appInfo)
        
        vc.viewModel = viewModel
        return vc
    }
}
