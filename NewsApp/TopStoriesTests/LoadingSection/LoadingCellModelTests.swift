//
//  LoadingCellModelTests.swift
//  TopStoriesTests
//
//  Created by Vinodh Govindaswamy on 28/03/20.
//  Copyright © 2020 Vinodh Govindaswamy. All rights reserved.
//

import XCTest
@testable import TopStoriesUI

class LoadingCellModelTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testCellModelCount() {
        let cellModel = LoadingCellModel()
        XCTAssertEqual(cellModel.cellType, NewsCellType.loadingskeleton.rawValue)
    }
}
