//
//  NewsDetailsSectionHandlerTests.swift
//  NewsDetailsTests
//
//  Created by Vinodh Govindaswamy on 28/03/20.
//  Copyright © 2020 Vinodh Govindaswamy. All rights reserved.
//

import XCTest
@testable import NewsDetailUI
@testable import NewsShared

class NewsDetailsSectionHandlerTests: XCTestCase {

    let sectionHandler: NewsDetailSectionHandler = NewsDetailSectionHandler()
    let collectionView: UICollectionView = UICollectionView(frame: .zero,
                                                            collectionViewLayout: UICollectionViewFlowLayout())

    override func setUp() {
        sectionHandler.registerCells(for: collectionView)
    }

    func testSectionHandlerType() {
        XCTAssertEqual(sectionHandler.type, NewsDetailsSectionType.newsDetails.rawValue)
    }

    func testSectionHandlerCell() {
        let cell = sectionHandler.cellProvider(collectionView,
                                               IndexPath(item: 0, section: 0),
                                               NewsDetailsCellModel(details: "Test details"))

        XCTAssert(cell.isKind(of: NewsDetailsCell.self), "Cell should be of type NewsDetailsCell")
    }

    func testSectionHandlerLayoutNotNil() {
        let layout = sectionHandler.sectionLayoutProvider(NewsDetailsSectionModel(details: "Test details"),
                                                          MockLayoutEnvironment())
        XCTAssertNotNil(layout)
    }
}
