//
//  ErrorSectionHandlerTests.swift
//  TopStoriesTests
//
//  Created by Vinodh Govindaswamy on 28/03/20.
//  Copyright © 2020 Vinodh Govindaswamy. All rights reserved.
//

import XCTest
@testable import TopStoriesUI

class ErrorSectionHandlerTests: XCTestCase {

    let sectionHandler: ErrorSectionHandler = ErrorSectionHandler(viewModel: nil)
    let collectionView: UICollectionView = UICollectionView(frame: .zero,
                                                            collectionViewLayout: UICollectionViewFlowLayout())
    override func setUp() {
        sectionHandler.registerCells(for: collectionView)
    }

    func testSectionHandlerType() {
        XCTAssertEqual(sectionHandler.type, NewsSectionType.error.rawValue)
    }

    func testSectionHandlerCell() {
        let cell = sectionHandler.cellProvider(collectionView,
                                               IndexPath(item: 0, section: 0),
                                               ErrorCellModel(errorMessage: "Error Message", actionTitle: "Retry"))

        XCTAssert(cell.isKind(of: ErrorCell.self), "Cell should be of type ErrorCell")
    }

    func testSectionHandlerLayoutNotNil() {
        let layout = sectionHandler.sectionLayoutProvider(ErrorSectionModel(errorMessage: "Error Message", actionTitle: "Retry"),
                                                          MockLayoutEnvironment())
        XCTAssertNotNil(layout)
    }
}
