//
//  NewsDetailSectionHandler.swift
//  NewsDetailsUI
//
//  Created by Vinodh Govindaswamy on 28/03/20.
//  Copyright © 2020 Vinodh Govindaswamy. All rights reserved.
//

import VSCollectionKit
import UIKit

class NewsDetailSectionHandler: SectionHandler {

    var type: String {
        return NewsDetailsSectionType.newsDetails.rawValue
    }

    func registerCells(for collectionView: UICollectionView) {
        collectionView.register(UINib(nibName: String(describing: NewsDetailsCell.self),
                                      bundle: Bundle(for: NewsDetailsCell.self)),
                                forCellWithReuseIdentifier: NewsDetailsCell.newsdetailCellID)
    }

    func cellProvider(_ collectionView: UICollectionView, _ indexPath: IndexPath, _ cellModel: CellModel) -> UICollectionViewCell {

        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NewsDetailsCell.newsdetailCellID, for: indexPath) as? NewsDetailsCell, let newsImageCellModel = cellModel as? NewsDetailsCellModel else { return UICollectionViewCell() }

        cell.cellModel = newsImageCellModel
        return cell
    }

    func sectionLayoutProvider(_ sectionModel: SectionModel, _ environment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection? {
        return newImageLayout()
    }

    private func newImageLayout() -> NSCollectionLayoutSection {

        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                              heightDimension: .estimated(100))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                               heightDimension: .estimated(100))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize,
                                                         subitems: [item])
        let sectionLayout = NSCollectionLayoutSection(group: group)
        return sectionLayout
    }
}
