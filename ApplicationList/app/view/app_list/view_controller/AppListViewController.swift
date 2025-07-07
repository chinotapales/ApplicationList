//
//  ViewController.swift
//  ApplicationList
//
//  Created by Carlo Gabriel Tapales on 06/07/2025.
//

import UIKit

class AppListViewController: BaseViewController, Storyboarded {
    static var storyboardName: String = "AppList"
    static var storyboardId: String = "AppListViewController"
    
    struct cellIds {
        static let emptyCell = "empty_cell"
        static let appListCell = "app_list_cell"
    }
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    var viewModel: AppListViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        bindViewModel()
    }
    
    func setupUI() {
        setupNavigationBar()
        setupSearchBar()
        setupTableView()
    }
}

private extension AppListViewController {
    private func setupNavigationBar() {
        guard let navigationController else {
            return
        }
        navigationController.navigationBar.prefersLargeTitles = true
        
        self.title = "Search"
    }
    
    private func setupSearchBar() {
        searchBar.placeholder = "Games, Apps, Stories and More"
        searchBar.tintColor = .tintColor
        
        searchBar.delegate = self
    }
    
    private func setupTableView() {
        tableView.register(EmptyTableViewCell.getNib(), forCellReuseIdentifier: cellIds.emptyCell)
        tableView.register(AppListTableViewCell.getNib(), forCellReuseIdentifier: cellIds.appListCell)
        tableView.rowHeight = UITableView.automaticDimension
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private func bindViewModel() {
        guard let viewModel else {
            return
        }
        viewModel.onLoading = { [weak self] in
            guard let self else {
                return
            }
            self.showLoading()
        }
        viewModel.onSearchResponse = { [weak self] in
            guard let self else {
                return
            }
            self.hideLoading {
                self.tableView.reloadData()
            }
        }
        viewModel.onError = { [weak self] error in
            guard let self else {
                return
            }
            NSLog("❌ Encountered an error \(error.localizedDescription)")
            self.hideLoading {
                self.showErrorDialog(error)
            }
        }
    }
}

extension AppListViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        
        guard let viewModel,
              let text = searchBar.text,
              !text.isEmpty else {
            return
        }
        
        let indexedText = text.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
        
        if isConnected {
            NSLog("🌐 Connected to the Internet")
            viewModel.search(term: indexedText)
        } else {
            NSLog("🚨 Not Connected to the Internet - Fetching Stored Data")
            viewModel.getStoredResponse(term: indexedText)
        }
     }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        guard let viewModel,
              let text = searchBar.text else {
            return
        }
        
        if text.isEmpty {
            viewModel.clearSearchResults()
        }
    }
}

extension AppListViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let viewModel else {
            return 0
        }
        
        if viewModel.appInfoDataSource.isEmpty {
            return 1
        }
        
        return viewModel.appInfoDataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let viewModel,
              !viewModel.appInfoDataSource.isEmpty else {
            let cell = tableView.dequeueReusableCell(withIdentifier: cellIds.emptyCell, for: indexPath) as! EmptyTableViewCell
            return cell
        }
        
        let cellViewModel = viewModel.appInfoDataSource[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIds.appListCell, for: indexPath) as! AppListTableViewCell
        
        cell.setupCell(viewModel: cellViewModel)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let viewModel,
              !viewModel.searchResults.isEmpty else {
            return
        }
        
        let appInfo = viewModel.searchResults[indexPath.row]
        let appDetailsViewController = MainAssembler.shared.resolveAppDetailsViewController(appInfo: appInfo)
        
        self.navigationController?.pushViewController(appDetailsViewController, animated: true)
    }
}
