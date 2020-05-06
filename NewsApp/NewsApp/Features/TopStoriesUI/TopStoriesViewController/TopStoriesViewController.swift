//
//  TopStoriesViewController.swift
//  TopStoriesUI
//
//  Created by Vinodh Govindaswamy on 24/03/20.
//  Copyright © 2020 Vinodh Govindaswamy. All rights reserved.
//

import NewsShared
import UIKit
import VSCollectionKit

enum NewsSectionType: String {
    case loading
    case news
    case error
}

enum NewsCellType: String {
    case loadingskeleton
    case fullWidthCard
    case card
    case groupedList
    case list
    case error
}

class TopStoriesViewController: VSCollectionViewController {

    var viewModel: TopStoriesViewAPI?

    override func willAddSectionControllers() {
        super.willAddSectionControllers()
        sectionHandler.addSectionHandler(handler: LoadingSectionHandler())
        sectionHandler.addSectionHandler(handler: newsSectionHandler())
        sectionHandler.addSectionHandler(handler: errorSectionHandler())
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        observeViewModelUpdates()
        viewModel?.fetchTopStories()

        configureNavigationBar()
        view.backgroundColor = .white
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }

    func newsSectionHandler() -> SectionHandler {
        return NewsSectionHandler(parentViewController: self.parent)
    }

    func errorSectionHandler() -> SectionHandler {
        return ErrorSectionHandler(viewModel: viewModel as? TopStoriesViewRetryAction)
    }

    override func configureCollectionView() {
        super.configureCollectionView()
        collectionView.backgroundColor =  AppColor.defaultBackgroundColor
    }

    private func configureNavigationBar() {
        navigationItem.title = viewModel?.title
        navigationController?.navigationBar.prefersLargeTitles = true
    }

    private func observeViewModelUpdates() {
        viewModel?.viewUpdateHandler = { [weak self] (collectionData, errrMessage) in
            guard let self = self else { return }
            guard let collectionViewData = collectionData else { return }
            self.apply(collectionData: collectionViewData, animated: true)
        }
    }
}

extension TopStoriesViewController {
    override func willTransition(to newCollection: UITraitCollection, with coordinator: UIViewControllerTransitionCoordinator) {
        coordinator.animate(alongsideTransition: { (context) in
            self.collectionView.collectionViewLayout.invalidateLayout()
            self.collectionView.reloadData()
        }, completion: nil)
    }
}
