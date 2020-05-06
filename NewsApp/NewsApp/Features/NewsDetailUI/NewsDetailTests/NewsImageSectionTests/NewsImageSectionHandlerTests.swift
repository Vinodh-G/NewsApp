//
//  NewsImageSectionHandlerTests.swift
//  NewsDetailsTests
//
//  Created by Vinodh Govindaswamy on 28/03/20.
//  Copyright © 2020 Vinodh Govindaswamy. All rights reserved.
//

import XCTest
@testable import NewsDetailUI
@testable import NewsShared

class NewsImageSectionHandlerTests: XCTestCase {

    let sectionHandler: NewsImageSectionHandler = NewsImageSectionHandler()
    let collectionView: UICollectionView = UICollectionView(frame: .zero,
                                                            collectionViewLayout: UICollectionViewFlowLayout())

    override func setUp() {
        sectionHandler.registerCells(for: collectionView)
    }

    func testSectionHandlerType() {
        XCTAssertEqual(sectionHandler.type, NewsDetailsSectionType.newsImage.rawValue)
    }

    func testSectionHandlerCell() {
        let cell = sectionHandler.cellProvider(collectionView,
                                               IndexPath(item: 0, section: 0),
                                               newsImageCellModel()!)

        XCTAssert(cell.isKind(of: NewsImageCell.self), "Cell should be of type NewsImageCell")
    }

    func testSectionHandlerLayoutNotNil() {
        let layout = sectionHandler.sectionLayoutProvider(newsImageSectionModel()!,
                                                          MockLayoutEnvironment())
        XCTAssertNotNil(layout)
    }
}

class MockLayoutEnvironment: NSObject, NSCollectionLayoutEnvironment {
    var container: NSCollectionLayoutContainer = MockLayoutContainer()
    var traitCollection: UITraitCollection = .current

    class MockLayoutContainer: NSObject, NSCollectionLayoutContainer {
        var contentSize: CGSize = .zero
        var effectiveContentSize: CGSize = .zero
        var contentInsets: NSDirectionalEdgeInsets = .zero
        var effectiveContentInsets: NSDirectionalEdgeInsets = .zero
    }
}
