//
//  NewsImageSectionHandler.swift
//  NewsDetailsUI
//
//  Created by Vinodh Govindaswamy on 28/03/20.
//  Copyright © 2020 Vinodh Govindaswamy. All rights reserved.
//

import VSCollectionKit
import UIKit

class NewsImageSectionHandler: SectionHandler {

    var type: String {
        return NewsDetailsSectionType.newsImage.rawValue
    }

    func registerCells(for collectionView: UICollectionView) {
        collectionView.register(UINib(nibName: String(describing: NewsImageCell.self),
                                      bundle: Bundle(for: NewsImageCell.self)),
                                forCellWithReuseIdentifier: NewsImageCell.newsImageCellID)
    }

    func cellProvider(_ collectionView: UICollectionView, _ indexPath: IndexPath, _ cellModel: CellModel) -> UICollectionViewCell {

        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NewsImageCell.newsImageCellID, for: indexPath) as? NewsImageCell,
            let newsImageCellModel = cellModel as? NewsImageCellModel else { return UICollectionViewCell() }

        cell.cellModel = newsImageCellModel
        return cell
    }

    func sectionLayoutProvider(_ sectionModel: SectionModel, _ environment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection? {
        return newImageLayout()
    }

    private func newImageLayout() -> NSCollectionLayoutSection {

        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                              heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                               heightDimension: .fractionalHeight(0.65))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize,
                                                         subitems: [item])
        let sectionLayout = NSCollectionLayoutSection(group: group)
        return sectionLayout
    }
}
