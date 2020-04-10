//
//  NewsListCell.swift
//  TopStoriesUI
//
//  Created by Vinodh Govindaswamy on 26/03/20.
//  Copyright © 2020 Vinodh Govindaswamy. All rights reserved.
//

import NewsShared
import UIKit

class NewsListCell: UICollectionViewCell {

    public static let newsItemCellID = String(describing: NewsListCell.self)

    private static let cornerRadius: CGFloat = 8

    @IBOutlet weak var contentShadowView: UIView!
    @IBOutlet weak var newsContentView: UIView!
    @IBOutlet weak var newsImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var timestampLabel: UILabel!

    var cellModel: NewsCellViewAPI? {
        didSet {
            if let viewModel = cellModel {
                configureCell(for: viewModel)
            }
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        configureView()
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        newsImageView.image = nil
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        contentShadowView.addShadow(cornerRadius: NewsListCell.cornerRadius)
    }

    func configureView() {
        newsContentView.layer.cornerRadius = NewsListCell.cornerRadius
        newsContentView.layer.masksToBounds = true

        contentView.backgroundColor = AppColor.defaultBackgroundColor
        titleLabel.textColor = AppColor.defaultTitleTextColor
        timestampLabel.textColor = AppColor.defaulttimeStampTextColor
    }

    func configureCell(for cellModel: NewsCellViewAPI) {
        if let imageUrl = cellModel.imageURL(size: .medium) {
            newsImageView.setImageFrom(imageURLString: imageUrl)
        }
        titleLabel.text = cellModel.title
        timestampLabel.text = cellModel.timeStamp
    }
}
