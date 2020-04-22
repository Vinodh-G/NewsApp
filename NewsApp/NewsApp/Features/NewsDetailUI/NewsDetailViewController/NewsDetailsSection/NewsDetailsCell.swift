//
//  NewsDetailsCell.swift
//  NewsDetailsUI
//
//  Created by Vinodh Govindaswamy on 28/03/20.
//  Copyright © 2020 Vinodh Govindaswamy. All rights reserved.
//

import UIKit

class NewsDetailsCell: UICollectionViewCell {

    public static let newsdetailCellID = String(describing: NewsDetailsCell.self)
    
    @IBOutlet weak var newsDetailsLabel: UILabel!

    var cellModel: NewsDetailsCellModel? {
        didSet {
            newsDetailsLabel.text = cellModel?.newsDetailsText
        }
    }
}
