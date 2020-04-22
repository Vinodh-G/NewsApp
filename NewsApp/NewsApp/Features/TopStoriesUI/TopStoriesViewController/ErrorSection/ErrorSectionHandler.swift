//
//  ErrorSectionHandler.swift
//  VNews
//
//  Created by Vinodh Govindaswamy on 28/03/20.
//  Copyright © 2020 Vinodh Govindaswamy. All rights reserved.
//

import VSCollectionKit
import UIKit

class ErrorSectionHandler: SectionHandler {
    var type: String {
        return NewsSectionType.error.rawValue
    }

    let viewModel: TopStoriesViewRetryAction?
    init(viewModel: TopStoriesViewRetryAction?) {
        self.viewModel = viewModel
    }

    func registerCells(for collectionView: UICollectionView) {

        let bundle = Bundle(for: LoadingCell.self)

        collectionView.register(UINib(nibName: String(describing: ErrorCell.self),
                                      bundle: bundle),
                                forCellWithReuseIdentifier: ErrorCell.errorCellIdentifier)
    }

    func cellProvider(_ collectionView: UICollectionView, _ indexPath: IndexPath, _ cellModel: CellModel) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ErrorCell.errorCellIdentifier,
                                                            for: indexPath) as? ErrorCell,
            let errorCellModel = cellModel as? ErrorCellModel else { return UICollectionViewCell() }
        cell.cellModel = errorCellModel
        cell.errorActionDelegate = self
        return cell
    }
}

extension ErrorSectionHandler: ErrorActionDelegate {
    func didTapOn(cell: ErrorCell, errorAction: String) {
        viewModel?.retry()
    }
}

extension ErrorSectionHandler {

    func sectionLayoutProvider(_ sectionModel: SectionModel, _ environment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection? {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                              heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                               heightDimension: .absolute(140))
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
