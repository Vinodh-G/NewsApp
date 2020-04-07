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

    lazy var sectionHandler: VSCollectionViewSectionHandller  = {
        let sectionHandler = VSCollectionViewSectionHandller()
        sectionHandler.addSectionHandler(handler: LoadingSectionHandler())
        sectionHandler.addSectionHandler(handler: newsSectionHandler())
        sectionHandler.addSectionHandler(handler: errorSectionHandler())
        return sectionHandler
    }()

    func newsSectionHandler() -> SectionHandler {
        return NewsSectionHandler(parentViewController: self.parent)
    }

    func errorSectionHandler() -> SectionHandler {
        return ErrorSectionHandler(viewModel: viewModel as? TopStoriesViewRetryAction)
    }

    override func configureDataSource() {
        super.configureDataSource()
        dataProvider = VSCollectionViewDataSource(collectionView: collectionView,
                                                  sectionHandler: sectionHandler)
    }

    override func configureDelegate() {
        super.configureDelegate()
        delegateHandler = VSCollectionViewDelegate(collectionView: collectionView,
                                                   sectionHandler: sectionHandler)
    }

    override func configureLayoutProvider() {
        super.configureLayoutProvider()
        layoutProvider = VSCollectionViewLayoutProvider(collectionView: collectionView,
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
        collectionView.backgroundColor =  AppColor.defaultBackgroundColor
    }

    private func configureNavigationBar() {
        navigationItem.title = viewModel?.title
        navigationController?.navigationBar.prefersLargeTitles = true
    }

    private func observeViewModelUpdates() {
        viewModel?.viewUpdateHandler = { [weak self] (collectionData, errrMessage) in
            guard let self = self else { return }
            guard let collectionViewData = collectionData,
                let dataSource = self.dataProvider,
                let delgateHandler = self.delegateHandler else { return }
            dataSource.apply(data: collectionViewData,
                             animated: true)
            delgateHandler.data = collectionViewData
        }
    }
}

extension TopStoriesViewController {
    override func willTransition(to newCollection: UITraitCollection, with coordinator: UIViewControllerTransitionCoordinator) {
        coordinator.animate(alongsideTransition: { (context) in
            self.collectionView.reloadData()
        }, completion: nil)
    }
}
