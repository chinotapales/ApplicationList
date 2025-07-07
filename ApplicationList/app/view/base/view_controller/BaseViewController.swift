//
//  BaseViewController.swift
//  ApplicationList
//
//  Created by Carlo Gabriel Tapales on 06/07/2025.
//

import UIKit

class BaseViewController: UIViewController {
    var loadingViewController: LoadingViewController?
    var isConnected: Bool {
        ReachabilityChecker.isConnectedToInternet
    }
    
    func showLoading() {
        loadingViewController = LoadingViewController()
        
        addChild(loadingViewController!)
        loadingViewController!.view.frame = view.frame
        view.addSubview(loadingViewController!.view)
        loadingViewController!.didMove(toParent: self)
    }
    
    func hideLoading(completionHandler: @escaping ()->()) {
        guard let loadingViewController else {
            return
        }
        
        loadingViewController.willMove(toParent: nil)
        loadingViewController.view.removeFromSuperview()
        loadingViewController.removeFromParent()
        
        completionHandler()
    }
    
    func showErrorDialog(_ error: Error) {
        let alert = UIAlertController(title: "Something went wrong...", message: error.localizedDescription, preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Ok", style: .cancel) { (_) in
            alert.dismiss(animated: true, completion: nil)
        }
        alert.addAction(action)
        present(alert, animated: true)
    }
}

protocol Storyboarded {
    static var storyboardName: String { get }
    static var storyboardId: String { get }
    static func instanciate() -> Self
}

extension Storyboarded where Self: UIViewController {
    static func instanciate() -> Self {
        let storyboard = UIStoryboard(name: storyboardName, bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: storyboardId) as! Self
    }
    
}
