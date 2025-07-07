//
//  EmptyTableViewCell.swift
//  ApplicationList
//
//  Created by Carlo Gabriel Tapales on 06/07/2025.
//


import UIKit

class EmptyTableViewCell: UITableViewCell {
    
    static func getNib() -> UINib {
       return UINib(nibName: "EmptyTableViewCell", bundle: nil)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.selectionStyle = .none
    }
}
