//
//  NewsDetailsCellModelTests.swift
//  NewsDetailsTests
//
//  Created by Vinodh Govindaswamy on 28/03/20.
//  Copyright © 2020 Vinodh Govindaswamy. All rights reserved.
//

import XCTest
@testable import NewsDetailUI
@testable import NewsShared
@testable import NewsService

class NewsDetailsCellModelTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }


    func testCellModelType() {
        let cellModel = newsDetailsCellModel()
        XCTAssertEqual(cellModel.cellType, NewsDetailsCellType.newsImage.rawValue)
    }

    func testTitle() {
        let cellModel = newsDetailsCellModel()
        XCTAssertEqual(cellModel.newsDetailsText, "Test details")
    }
    func newsDetailsCellModel() -> NewsDetailsCellModel {
        return NewsDetailsCellModel(details: "Test details")
    }
}
