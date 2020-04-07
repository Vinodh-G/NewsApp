//
//  FullWidthCardCell.swift
//  TopStoriesUI
//
//  Created by Vinodh Govindaswamy on 25/03/20.
//  Copyright © 2020 Vinodh Govindaswamy. All rights reserved.
//

import UIKit
import NewsShared

class FullWidthCardCell: UICollectionViewCell {

    public static let newsItemCellID = String(describing: FullWidthCardCell.self)

    @IBOutlet weak var newsContentView: UIView!
    @IBOutlet weak var newsImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var timestampLabel: UILabel!
    var gradientBackground: CAGradientLayer!
    
    var cellModel: NewsCellViewAPI? {
        didSet {
            if let viewModel = cellModel {
                configureCell(for: viewModel)
            }
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        contentView.backgroundColor = AppColor.defaultBackgroundColor
        setUpGradiantBackground()
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        gradientBackground.frame = newsImageView.bounds
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        newsImageView.image = nil
    }

    func configureCell(for cellModel: NewsCellViewAPI) {
        if let imageUrl = cellModel.imageURL(size: .medium) {
            newsImageView.setImageFrom(imageURLString: imageUrl)
        }
        titleLabel.text = cellModel.title
        timestampLabel.text = cellModel.timeStamp
    }

    func configureUI() {
        titleLabel.textColor = AppColor.highlightTitleTextColor
        timestampLabel.textColor = AppColor.highlighttimeStampTextColor
    }

    private func setUpGradiantBackground() {
        gradientBackground = CAGradientLayer()
        gradientBackground.frame = newsImageView.frame
        gradientBackground.colors = [UIColor.clear.cgColor,
                                     UIColor.black.withAlphaComponent(0.9).cgColor]
        gradientBackground.startPoint = CGPoint(x: 0, y: 0.5)
        gradientBackground.endPoint = CGPoint(x: 0, y: 1)
        newsContentView.layer.insertSublayer(gradientBackground, above: newsImageView.layer)
    }
}
