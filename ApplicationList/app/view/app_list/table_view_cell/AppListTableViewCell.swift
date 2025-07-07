//
//  AppListTableViewCell.swift
//  ApplicationList
//
//  Created by Carlo Gabriel Tapales on 06/07/2025.
//

import UIKit
import Kingfisher

class AppListTableViewCell: UITableViewCell {
    
    @IBOutlet weak var appIconImageView: UIImageView!
    @IBOutlet weak var trackNameLabel: UILabel!
    @IBOutlet weak var sellerNameLabel: UILabel!
    
    static func getNib() -> UINib {
       return UINib(nibName: "AppListTableViewCell", bundle: nil)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.selectionStyle = .none
        self.applyCornerRadius()
    }
    
    func setupCell(viewModel: AppListTableViewCellViewModel) {
        self.trackNameLabel.text = viewModel.trackName
        self.sellerNameLabel.text = viewModel.sellerName
        
        if let imageUrl = viewModel.imageUrl, UIApplication.shared.canOpenURL(imageUrl) {
            self.appIconImageView.kf.setImage(with: imageUrl, placeholder: UIImage(systemName: "questionmark.circle.fill"))
        } else {
            self.appIconImageView.image = UIImage(systemName: "questionmark.circle.fill")
        }
    }
    
    func applyCornerRadius() {
        self.appIconImageView.layer.cornerRadius = 10
    }
}
