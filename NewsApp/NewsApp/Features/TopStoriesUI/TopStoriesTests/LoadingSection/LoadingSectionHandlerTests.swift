//
//  LoadingSectionHandlerTests.swift
//  TopStoriesTests
//
//  Created by Vinodh Govindaswamy on 28/03/20.
//  Copyright © 2020 Vinodh Govindaswamy. All rights reserved.
//

import XCTest
@testable import TopStoriesUI

class LoadingSectionHandlerTests: XCTestCase {

    let sectionHandler: LoadingSectionHandler = LoadingSectionHandler()
    let collectionView: UICollectionView = UICollectionView(frame: .zero,
                                                            collectionViewLayout: UICollectionViewFlowLayout())
    override func setUp() {
        sectionHandler.registerCells(for: collectionView)
    }

    func testSectionHandlerType() {
        XCTAssertEqual(sectionHandler.type, NewsSectionType.loading.rawValue)
    }

    func testSectionHandlerCell() {
        let cell = sectionHandler.cellProvider(collectionView,
                                               IndexPath(item: 0, section: 0),
                                               LoadingCellModel())

        XCTAssert(cell.isKind(of: LoadingCell.self), "Cell should be of type LoadingCell")
    }

    func testSectionHandlerLayoutNotNil() {
        let layout = sectionHandler.collectionLayout(for: LoadingSectionModel(),
                                                     environment: MockLayoutEnvironment())
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
