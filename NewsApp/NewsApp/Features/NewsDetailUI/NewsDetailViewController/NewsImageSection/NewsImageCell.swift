//
//  NewsImageCell.swift
//  NewsDetailsUI
//
//  Created by Vinodh Govindaswamy on 28/03/20.
//  Copyright © 2020 Vinodh Govindaswamy. All rights reserved.
//

import NewsShared
import UIKit

class NewsImageCell: UICollectionViewCell {
    public static let newsImageCellID = String(describing: NewsImageCell.self)

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var timeStampLabel: UILabel!
    @IBOutlet weak var newsImageView: UIImageView!
    @IBOutlet weak var blurView: UIVisualEffectView!
    var gradientBackground: CAGradientLayer!


    var cellModel: NewsImageCellModel? {
        didSet {
            if let viewModel = cellModel {
                configureCell(cellModel: viewModel)
            }
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        setUpGradiantBackground()
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        gradientBackground.frame = contentView.bounds
    }

    func configureCell(cellModel: NewsImageCellModel) {
        if let imageUrl = cellModel.imageUrl,
            let cachedImageUrl = cellModel.cachedImageUrl {
            newsImageView.setImageFrom(imageURLString: cachedImageUrl)
            blurView.isHidden = false
            newsImageView.setImageFrom(imageURLString: imageUrl) { [weak self] (image, error) in

                DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.5) {
                     self?.blurView.isHidden = true
                }
            }
        }

        titleLabel.text = cellModel.title
        timeStampLabel.text = cellModel.timestamp
    }

    private func setUpGradiantBackground() {
        gradientBackground = CAGradientLayer()
        gradientBackground.frame = newsImageView.frame
        gradientBackground.colors = [UIColor.clear.cgColor,
                                     UIColor.black.withAlphaComponent(0.9).cgColor]
        gradientBackground.startPoint = CGPoint(x: 0, y: 0.5)
        gradientBackground.endPoint = CGPoint(x: 0, y: 1)
        contentView.layer.insertSublayer(gradientBackground, above: newsImageView.layer)
    }
}
