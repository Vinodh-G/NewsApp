//
//  NewsSectionHandlerTests.swift
//  TopStoriesTests
//
//  Created by Vinodh Govindaswamy on 28/03/20.
//  Copyright © 2020 Vinodh Govindaswamy. All rights reserved.
//

import XCTest
@testable import TopStoriesUI
@testable import NewsShared

class NewsSectionHandlerTests: XCTestCase {

    let sectionHandler: NewsSectionHandler = NewsSectionHandler(parentViewController: nil)
    let collectionView: UICollectionView = UICollectionView(frame: .zero,
                                                            collectionViewLayout: UICollectionViewFlowLayout())
    override func setUp() {
        sectionHandler.registerCells(for: collectionView)
    }

    func testSectionHandlerType() {
        XCTAssertEqual(sectionHandler.type, NewsSectionType.news.rawValue)
    }

    func testSectionHandlerFullWidthCell() {
        guard let cellModel = newsItemCellModel(cellType: .fullWidthCard) else { return }
        let cell = sectionHandler.cellProvider(collectionView,
                                               IndexPath(item: 0, section: 0),
                                               cellModel)

        XCTAssert(cell.isKind(of: FullWidthCardCell.self), "Cell should be of type FullWidthCardCell")
    }

    func testSectionHandlerCardCell() {
        guard let cellModel = newsItemCellModel(cellType: .card) else { return }
        let cell = sectionHandler.cellProvider(collectionView,
                                               IndexPath(item: 0, section: 0),
                                               cellModel)

        XCTAssert(cell.isKind(of: CardCell.self), "Cell should be of type CardCell")
    }

    func testSectionHandlerListCell() {
        guard let cellModel = newsItemCellModel(cellType: .list) else { return }
        let cell = sectionHandler.cellProvider(collectionView,
                                               IndexPath(item: 0, section: 0),
                                               cellModel)

        XCTAssert(cell.isKind(of: NewsListCell.self), "Cell should be of type NewsListCell")
    }

    func testSectionHandlerLayoutNotNil() {
        guard let sectionModel = newsSectionModel(catType: "world") else { return }

        let layout = sectionHandler.sectionLayoutProvider(sectionModel,
                                                          MockLayoutEnvironment())
        XCTAssertNotNil(layout)
    }

}
