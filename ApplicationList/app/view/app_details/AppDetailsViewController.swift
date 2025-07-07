//
//  AppDetailsViewController.swift
//  ApplicationList
//
//  Created by Carlo Gabriel Tapales on 06/07/2025.
//

import UIKit
import Kingfisher

class AppDetailsViewController: BaseViewController, Storyboarded {
    static var storyboardName: String = "AppDetails"
    static var storyboardId: String = "AppDetailsViewController"
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var trackNameLabel: UILabel!
    @IBOutlet weak var artistLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var averageRatingLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var viewModel: AppDetailsViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    func setupUI() {
        setupNavigationBar()
        setupImageView()
        setupLabels()
    }
}

private extension AppDetailsViewController {
    private func setupNavigationBar() {
        guard let navigationController else {
            return
        }
        navigationController.navigationBar.prefersLargeTitles = false
    }
    
    private func setupImageView() {
        guard let viewModel else {
            return
        }
        
        self.imageView.layer.cornerRadius = 20
        
        if let imageUrl = viewModel.imageUrl, UIApplication.shared.canOpenURL(imageUrl) {
            self.imageView.kf.setImage(with: imageUrl, placeholder: UIImage(systemName: "questionmark.circle.fill"))
        }  else {
            self.imageView.image = UIImage(systemName: "questionmark.circle.fill")
        }
    }
    
    private func setupLabels() {
        guard let viewModel else {
            return
        }
        
        self.trackNameLabel.text = viewModel.trackName
        self.artistLabel.text = viewModel.artistName
        self.priceLabel.text = viewModel.formattedPrice
        self.averageRatingLabel.text = viewModel.averageUserRating
        self.descriptionLabel.text = viewModel.description
    }
}
