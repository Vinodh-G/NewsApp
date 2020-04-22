//
//  NewsDetailViewController.swift
//  NewsDetailsUI
//
//  Created by Vinodh Govindaswamy on 27/03/20.
//  Copyright © 2020 Vinodh Govindaswamy. All rights reserved.
//

import NewsShared
import UIKit
import VSCollectionKit

enum NewsDetailsSectionType: String {
    case newsImage
    case newsDetails
}

enum NewsDetailsCellType: String {
    case newsImage
    case newsDetails
}

class NewsDetailViewController: VSCollectionViewController {

    var viewModel: NewsDetailsViewAPI?

    override func willAddSectionControllers() {
        super.willAddSectionControllers()
        sectionHandler.addSectionHandler(handler: NewsImageSectionHandler())
        sectionHandler.addSectionHandler(handler: NewsDetailSectionHandler())
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        guard let collectionData = viewModel?.collectionViewData else { return }
        apply(collectionData: collectionData, animated: true)
    }

    override func configureCollectionView() {
        super.configureCollectionView()
        collectionView.backgroundColor = .white
    }
}
