//
//  NewsSectionHandler.swift
//  TopStoriesUI
//
//  Created by Vinodh Govindaswamy on 25/03/20.
//  Copyright © 2020 Vinodh Govindaswamy. All rights reserved.
//

import Plugin
import VSCollectionKit
import UIKit

class NewsSectionHandler: SectionHandler {
    var type: String {
        return NewsSectionType.news.rawValue
    }

    static let sectionHeaderKind = "section-header-element-kind"
    weak var parentViewController: UIViewController?

    let layoutHandler: NewsLayoutHandler

    init(parentViewController: UIViewController?) {
        self.parentViewController = parentViewController
        layoutHandler = NewsLayoutHandler()
    }
    
    func registerCells(for collectionView: UICollectionView) {

        let bundle = Bundle(for: FullWidthCardCell.self)

        // FullWidthCardCell
        collectionView.register(UINib(nibName: String(describing: FullWidthCardCell.self),
                                      bundle: bundle),
                                forCellWithReuseIdentifier: FullWidthCardCell.newsItemCellID)

        // CardCell
        collectionView.register(UINib(nibName: String(describing: CardCell.self),
                                      bundle: bundle),
                                forCellWithReuseIdentifier: CardCell.newsItemCellID)

        // CardCell
        collectionView.register(UINib(nibName: String(describing: NewsListCell.self),
                                      bundle: bundle),
                                forCellWithReuseIdentifier: NewsListCell.newsItemCellID)

        let headerViewNib = UINib(nibName: String(describing: NewsSectionHeaderView.self),
                                  bundle: bundle)
        collectionView.register(headerViewNib,
                                forSupplementaryViewOfKind: NewsSectionHandler.sectionHeaderKind,
                                withReuseIdentifier: NewsSectionHeaderView.newsHeaderViewReuseID)
    }

    func cellProvider(_ collectionView: UICollectionView,
                      _ indexPath: IndexPath,
                      _ cellModel: CellModel) -> UICollectionViewCell {
        guard let newsItemCellModel = cellModel as? NewsCellModel else { return UICollectionViewCell() }

        switch newsItemCellModel.cellType {
        case NewsCellType.fullWidthCard.rawValue:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FullWidthCardCell.newsItemCellID,
                                                                for: indexPath) as? FullWidthCardCell else { return UICollectionViewCell() }
            cell.cellModel = newsItemCellModel
            return cell

        case NewsCellType.card.rawValue:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CardCell.newsItemCellID,
                                                                for: indexPath) as? CardCell else { return UICollectionViewCell() }
            cell.cellModel = newsItemCellModel
            return cell
        default:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NewsListCell.newsItemCellID,
                                                                for: indexPath) as? NewsListCell else { return UICollectionViewCell() }
            cell.cellModel = newsItemCellModel
            return cell

        }
    }

    func supplementaryViewProvider(_ collectionView: UICollectionView,
                                   _ kind: String,
                                   _ indexPath: IndexPath,
                                   _ headerViewModel: HeaderViewModel) -> UICollectionReusableView? {
        switch kind {
        case NewsSectionHandler.sectionHeaderKind:
            guard let view = collectionView.dequeueReusableSupplementaryView(ofKind: kind,
                                                                             withReuseIdentifier: NewsSectionHeaderView.newsHeaderViewReuseID,
                                                                             for: indexPath) as? NewsSectionHeaderView,
                let newsHeaderModel = headerViewModel as? NewsHeaderModel else { return nil }
            view.viewModel = newsHeaderModel
            return view
        default:
            return nil
        }
    }
}

extension NewsSectionHandler {

    func sectionLayoutProvider(_ sectionModel: SectionModel, _ environment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection? {
        guard let newsCatType = (sectionModel as? NewsSectionModel)?.categoryType else { return nil }
        let layoutType = NewsLayoutHandler.layoutType(for: newsCatType)
        return layoutHandler.sectionLayout(layoutType: layoutType)
    }
}

extension NewsSectionHandler {
    func didSelect(_ collectionView: UICollectionView, _ indexPath: IndexPath, _ cellModel: CellModel) {
        guard let newsItemCellModel = cellModel as? NewsCellModel else { return }
        let newsDetailsParam = NewsDetailsPageParam(pageId: "", data: newsItemCellModel.newsData)

        guard let newsDetailPlugin = PluginManager.shared.plugin(for: NewsDetailsUIPluginId)?.plug() as? NewsDetailsUIAPI,
            let detailViewController = newsDetailPlugin.newsDetailsViewController(param: newsDetailsParam),
            let navController = parentViewController as? UINavigationController else { return }

        detailViewController.modalPresentationStyle = .automatic
        navController.present(detailViewController,
                              animated: true,
                              completion: nil)
    }

    func willDisplayCell(_ collectionView: UICollectionView,
                         _ indexPath: IndexPath,
                         _ cell: UICollectionViewCell,
                         _ cellModel: CellModel) {
        cell.layoutIfNeeded()
    }
}
