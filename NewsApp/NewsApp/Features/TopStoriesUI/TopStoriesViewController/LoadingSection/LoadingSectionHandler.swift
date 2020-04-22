//
//  LoadingSectionHandler.swift
//  TopStoriesUI
//
//  Created by Vinodh Govindaswamy on 25/03/20.
//  Copyright © 2020 Vinodh Govindaswamy. All rights reserved.
//

import VSCollectionKit
import UIKit

class LoadingSectionHandler: SectionHandler {

    var type: String {
        return NewsSectionType.loading.rawValue
    }

    func registerCells(for collectionView: UICollectionView) {

        let bundle = Bundle(for: LoadingCell.self)

        // FullWidthCardCell
        collectionView.register(UINib(nibName: String(describing: LoadingCell.self),
                                      bundle: bundle),
                                forCellWithReuseIdentifier: LoadingCell.loadingCellID)
    }

    func cellProvider(_ collectionView: UICollectionView, _ indexPath: IndexPath, _ cellModel: CellModel) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: LoadingCell.loadingCellID,
                                                            for: indexPath) as? LoadingCell else { return UICollectionViewCell() }
        return cell
    }
}

extension LoadingSectionHandler {

    func sectionLayoutProvider(_ sectionModel: SectionModel, _ environment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection? {

        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                              heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                               heightDimension: .absolute(130))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize,
                                                         subitems: [item])
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 12,
                                                        leading: 12,
                                                        bottom: 12,
                                                        trailing: 12)
        return section
    }
}
