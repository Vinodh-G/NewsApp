//
//  LoadingSectionModelTests.swift
//  NewsServiceTests
//
//  Created by Vinodh Govindaswamy on 28/03/20.
//  Copyright © 2020 Vinodh Govindaswamy. All rights reserved.
//

import XCTest
@testable import TopStoriesUI

class LoadingSectionModelTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testSectionModelType() {
        let sectionModel = loagingsectionModel()
        XCTAssertEqual(sectionModel.sectionType, NewsSectionType.loading.rawValue)
    }

    func testCellModelCount() {
        let sectionModel = loagingsectionModel()
        XCTAssertEqual(sectionModel.items.count, 1)
    }

    func loagingsectionModel() -> LoadingSectionModel {
        return LoadingSectionModel()
    }
}
