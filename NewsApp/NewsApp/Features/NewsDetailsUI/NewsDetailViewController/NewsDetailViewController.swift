//
//  NewsDetailViewController.swift
//  NewsDetailsUI
//
//  Created by Vinodh Govindaswamy on 27/03/20.
//  Copyright © 2020 Vinodh Govindaswamy. All rights reserved.
//

import NewsShared
import UIKit

enum NewsDetailsSectionType: String {
    case newsImage
    case newsDetails
}

enum NewsDetailsCellType: String {
    case newsImage
    case newsDetails
}

class NewsDetailViewController: VNCollectionViewController {

    var viewModel: NewsDetailsViewAPI?

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    lazy var sectionHandler: VNCollectionViewSectionHandller  = {
        let sectionHandler = VNCollectionViewSectionHandller()
        sectionHandler.addSectionHandler(handler: NewsImageSectionHandler())
        sectionHandler.addSectionHandler(handler: NewsDetailSectionHandler())
        return sectionHandler
    }()


    override func configureDataSource() {
        super.configureDataSource()
        dataProvider = VNCollectionViewDataSource(collectionView: collectionView,
                                                  sectionHandler: sectionHandler)

        guard let data = viewModel?.collectionViewData else { return }
        dataProvider?.apply(data: data, animated: true)
    }

    override func configureDelegate() {
        super.configureDelegate()
        delegateHandler = VNCollectionViewDelegate(collectionView: collectionView,
                                                   sectionHandler: sectionHandler)
    }

    override func configureLayoutProvider() {
        super.configureLayoutProvider()
        layoutProvider = VNCollectionViewLayoutProvider(collectionView: collectionView,
                                                        sectionHandler: sectionHandler)
    }

    override func configureCollectionView() {

        collectionViewLayout = UICollectionViewCompositionalLayout(sectionProvider: { [weak self] (section, enviroment) -> NSCollectionLayoutSection? in
            guard let viewModel = self?.viewModel,
                let sectionModel = viewModel.collectionViewData?.sections[section] else { return nil }

            return self?.layoutProvider?.collectionLayout(for: sectionModel,
                                                          environment: enviroment)

        })
        super.configureCollectionView()
        collectionView.backgroundColor = .white
    }
}
