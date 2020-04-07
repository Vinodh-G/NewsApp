//
//  NewsSectionHeaderView.swift
//  TopStoriesUI
//
//  Created by Vinodh Govindaswamy on 25/03/20.
//  Copyright © 2020 Vinodh Govindaswamy. All rights reserved.
//

import NewsShared
import UIKit

class NewsSectionHeaderView: UICollectionReusableView {

    public static let newsHeaderViewReuseID = String(describing: NewsSectionHeaderView.self)
    @IBOutlet weak var titleLabel: UILabel!

    var viewModel: NewsHeaderModel? {
        didSet {
            titleLabel.text = viewModel?.headerTitle
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = AppColor.defaultBackgroundColor
    }
}
