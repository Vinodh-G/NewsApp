//
//  LoadingCell.swift
//  TopStoriesUI
//
//  Created by Vinodh Govindaswamy on 27/03/20.
//  Copyright © 2020 Vinodh Govindaswamy. All rights reserved.
//

import NewsShared
import UIKit

class LoadingCell: UICollectionViewCell {

    public static let loadingCellID = String(describing: LoadingCell.self)

    @IBOutlet weak var loadingContentView: UIView!
    @IBOutlet weak var shadowView: UIView!
    @IBOutlet weak var loadingMessageLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        contentView.backgroundColor = AppColor.defaultBackgroundColor
    }
}
